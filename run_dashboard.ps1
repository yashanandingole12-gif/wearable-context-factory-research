$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    throw "Python was not found on PATH. Install Python 3.11+ and retry."
}

python -c "import streamlit, plotly, pandas" 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Installing research dashboard dependencies..." -ForegroundColor Yellow
    python -m pip install -r requirements-research.txt
}

Write-Host "Starting Smart Factory HMI/HRI Research Dashboard..." -ForegroundColor Cyan
Write-Host "Open http://localhost:8505" -ForegroundColor Green
python -m streamlit run research_dashboard.py --server.port 8505

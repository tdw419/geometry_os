# systems/pixel_compiler/tests/test_pm_analysis_server.py
"""Tests for AI PM analysis HTTP endpoint."""

import pytest
import requests
import subprocess
import time
import signal
import sys


class TestPMAnalysisServer:
    """Test HTTP endpoint for AI PM analysis."""

    @pytest.fixture(scope="class")
    def server(self):
        """Start test server on port 8769."""
        proc = subprocess.Popen([
            sys.executable, "-m", "systems.visual_shell.web.pm_analysis_server", "8769"
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        time.sleep(2)
        yield "http://localhost:8769"
        proc.send_signal(signal.SIGTERM)
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            proc.kill()
            proc.wait()

    def test_health_endpoint(self, server):
        """Health endpoint should return OK."""
        response = requests.get(f"{server}/health")
        assert response.status_code == 200
        assert response.json()["status"] == "ok"

    def test_analyze_endpoint(self, server):
        """Analyze endpoint should return recommendations."""
        response = requests.post(f"{server}/pm/analyze", json={
            "scope": "recent",
            "max_recommendations": 5
        })

        assert response.status_code == 200
        data = response.json()
        assert "recommendations" in data
        assert isinstance(data["recommendations"], list)

    def test_analyze_and_deploy_endpoint(self, server):
        """Analyze and deploy should return cartridge info."""
        response = requests.post(f"{server}/pm/analyze_and_deploy", json={
            "scope": "recent",
            "auto_deploy": False,  # Just analyze, don't actually deploy
            "cartridge_name": "test_auto_fix"
        })

        assert response.status_code == 200
        data = response.json()
        assert "success" in data
        # When auto_deploy=False, should return analysis results
        if data["success"]:
            assert "recommendations" in data

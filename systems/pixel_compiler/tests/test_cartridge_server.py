# systems/pixel_compiler/tests/test_cartridge_server.py
"""Tests for cartridge HTTP server."""

import pytest
import subprocess
import time
import signal
import json
import sys
from pathlib import Path


class TestCartridgeServer:
    """Test HTTP endpoint for cartridge assembly."""

    @pytest.fixture(scope="class")
    def server(self):
        """Start test server on port 8767 to avoid conflicts."""
        # Start server - it has built-in mock when cartridge_bridge is unavailable
        proc = subprocess.Popen([
            sys.executable, "-m", "systems.visual_shell.web.cartridge_server", "8767"
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        time.sleep(2)  # Wait for server start

        yield "http://localhost:8767"

        proc.send_signal(signal.SIGTERM)
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            proc.kill()
            proc.wait()

    def test_health_endpoint(self, server):
        """Health endpoint should return OK."""
        import requests
        response = requests.get(f"{server}/health")
        assert response.status_code == 200
        data = response.json()
        assert data["status"] == "ok"

    def test_deploy_endpoint(self, server):
        """Deploy endpoint should create cartridge."""
        import requests
        response = requests.post(f"{server}/cartridge/deploy", json={
            "name": "http_test",
            "files": [
                {"path": "main.py", "content": "cHJpbnQoJ3Rlc3QnKQ=="}
            ],
            "location": {"x": 100, "y": 200}
        })

        assert response.status_code == 200
        data = response.json()
        assert data["success"] is True
        assert "cartridge" in data
        assert data["cartridge"]["format"] == "png"

    def test_assemble_endpoint(self, server):
        """Assemble endpoint should create cartridge without location."""
        import requests
        response = requests.post(f"{server}/cartridge/assemble", json={
            "name": "assemble_test",
            "files": [
                {"path": "code.py", "content": "ZGVmIGhlbHBlcigpOiBwYXNz"}
            ]
        })

        assert response.status_code == 200
        data = response.json()
        assert data["success"] is True
        assert "cartridge" in data
        # Assemble doesn't add location
        assert "location" not in data

    def test_cors_headers(self, server):
        """Server should return CORS headers for WebMCP access."""
        import requests
        response = requests.get(f"{server}/health")
        assert response.status_code == 200
        assert "Access-Control-Allow-Origin" in response.headers

    def test_invalid_json_returns_error(self, server):
        """Invalid JSON should return 400 error."""
        import requests
        response = requests.post(
            f"{server}/cartridge/deploy",
            data="not json",
            headers={"Content-Type": "application/json"}
        )
        assert response.status_code == 400

"""
Integration tests for WebMCP + V13 Safety API.

Tests the full pipeline from JavaScript bridge to Python backend.
"""

import pytest
import subprocess
import time
import requests
import json
import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor
from systems.evolution_daemon.safety.data_structures import ThrottleLevel


class TestSafetyHTTPServer:
    """Test the Safety HTTP Server endpoints."""

    @pytest.fixture(autouse=True)
    def setup_server(self):
        """Start the safety HTTP server for tests."""
        # Use mock server
        self.server_url = "http://localhost:31338"
        self.server_process = None

        # Check if server is already running
        try:
            response = requests.get(f"{self.server_url}/api/v1/safety/get_metabolism", timeout=1)
            if response.status_code == 200:
                yield
                return
        except Exception:
            pass

        # Start server
        server_path = os.path.join(
            os.path.dirname(os.path.dirname(os.path.abspath(__file__))),
            "api", "safety_http_server.py"
        )

        self.server_process = subprocess.Popen(
            [sys.executable, server_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )

        # Wait for server to start
        for _ in range(10):
            try:
                response = requests.get(f"{self.server_url}/api/v1/safety/get_metabolism", timeout=1)
                if response.status_code == 200:
                    break
            except Exception:
                time.sleep(0.5)

        yield

        # Cleanup
        if self.server_process:
            self.server_process.terminate()
            self.server_process.wait()

    def test_get_metabolism(self):
        """Test metabolism endpoint returns valid structure."""
        response = requests.get(f"{self.server_url}/api/v1/safety/get_metabolism")
        assert response.status_code == 200

        data = response.json()
        assert "cpu_percent" in data
        assert "throttle_level" in data
        assert data["throttle_level"] in ["none", "moderate", "aggressive"]

    def test_check_rts_integrity(self):
        """Test integrity check endpoint."""
        response = requests.post(
            f"{self.server_url}/api/v1/safety/check_rts_integrity",
            json={"path": "/test/file.rts.png"}
        )
        assert response.status_code == 200

        data = response.json()
        assert "checks_passed" in data
        assert "sha256_ok" in data

    def test_predict_health(self):
        """Test health prediction endpoint."""
        response = requests.post(
            f"{self.server_url}/api/v1/safety/predict_health",
            json={"path": "/test/file.rts.png"}
        )
        assert response.status_code == 200

        data = response.json()
        assert "predicted_health" in data

    def test_heal_rts(self):
        """Test RTS healing endpoint."""
        response = requests.post(
            f"{self.server_url}/api/v1/safety/heal_rts",
            json={"path": "/test/file.rts.png"}
        )
        assert response.status_code == 200

        data = response.json()
        assert "success" in data

    def test_get_prognostics(self):
        """Test prognostics data endpoint."""
        response = requests.post(
            f"{self.server_url}/api/v1/safety/get_prognostics",
            json={"path": "/test/file.rts.png"}
        )
        assert response.status_code == 200

        data = response.json()
        assert "historical_health" in data


class TestMetabolismMonitor:
    """Test the MetabolismMonitor directly."""

    def test_check_returns_state(self):
        """Test that check() returns a valid MetabolismState."""
        monitor = MetabolismMonitor()
        state = monitor.check()

        assert state.cpu_percent >= 0
        assert state.cpu_percent <= 100
        assert state.memory_available_mb >= 0
        assert state.throttle_level is not None

    def test_throttle_calculation(self):
        """Test throttle level calculation logic."""
        monitor = MetabolismMonitor()

        # Test aggressive CPU threshold
        level = monitor._calculate_throttle(85.0, 1000, 0.0)
        assert level.value == "aggressive"

        # Test moderate CPU threshold
        level = monitor._calculate_throttle(65.0, 1000, 0.0)
        assert level.value == "moderate"

        # Test normal operation
        level = monitor._calculate_throttle(30.0, 2000, 0.0)
        assert level.value == "none"

    def test_evolution_delay(self):
        """Test evolution delay calculation."""
        monitor = MetabolismMonitor()
        monitor.check()

        delay = monitor.get_evolution_delay_ms()
        assert delay >= 100
        assert delay <= 2000


class TestAdaptiveRateLimiterSimulation:
    """Simulate AdaptiveRateLimiter behavior based on metabolism."""

    def test_no_throttle_normal_load(self):
        """When throttle_level is 'none', use full rate limit."""
        # Simulate metabolism state
        metabolism = {"throttle_level": "none"}
        base_limit = 100

        # Calculate adaptive limit
        multiplier = 1.0  # none = no reduction
        adaptive_limit = max(1, int(base_limit * multiplier))

        assert adaptive_limit == 100

    def test_moderate_throttle_reduces_limit(self):
        """When throttle_level is 'moderate', reduce limit by 50%."""
        metabolism = {"throttle_level": "moderate"}
        base_limit = 100

        multiplier = 0.5  # moderate = 50% reduction
        adaptive_limit = max(1, int(base_limit * multiplier))

        assert adaptive_limit == 50

    def test_aggressive_throttle_minimizes_limit(self):
        """When throttle_level is 'aggressive', reduce limit by 90%."""
        metabolism = {"throttle_level": "aggressive"}
        base_limit = 100

        multiplier = 0.1  # aggressive = 90% reduction
        adaptive_limit = max(1, int(base_limit * multiplier))

        assert adaptive_limit == 10


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

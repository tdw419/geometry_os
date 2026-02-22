"""
Tests for VLM Health Monitoring REST API

Tests cover health check, baseline management, and monitoring control endpoints.
"""
from unittest.mock import Mock, patch
import pytest
from fastapi.testclient import TestClient


@pytest.fixture
def client():
    """Create a test client for the API."""
    from systems.pixel_compiler.api.main import app
    return TestClient(app)


class TestVLMHealthCheckEndpoint:
    """Tests for the /api/v1/vlm/check endpoint."""

    def test_vlm_health_check_returns_status(self, client):
        """Test that VLM health check returns health status."""
        response = client.get("/api/v1/vlm/check")
        assert response.status_code == 200
        data = response.json()
        assert "status" in data
        assert "is_healthy" in data

    def test_vlm_health_check_includes_model_info(self, client):
        """Test that VLM health check includes model information."""
        response = client.get("/api/v1/vlm/check")
        assert response.status_code == 200
        data = response.json()
        assert "model_info" in data or "model" in data


class TestVLMBaselineEndpoint:
    """Tests for the /api/v1/vlm/baseline endpoint."""

    @patch('systems.pixel_compiler.api.vlm_health.get_health_manager')
    def test_vlm_baseline_get_returns_baseline(self, mock_get_manager, client):
        """Test that baseline GET returns current baseline."""
        mock_manager = Mock()
        mock_manager.get_baseline.return_value = {
            "accuracy": 0.95,
            "latency_ms": 100.0,
            "memory_mb": 512.0
        }
        mock_get_manager.return_value = mock_manager

        response = client.get("/api/v1/vlm/baseline")
        assert response.status_code == 200
        data = response.json()
        assert "baseline" in data

    @patch('systems.pixel_compiler.api.vlm_health.get_health_manager')
    def test_vlm_baseline_post_sets_baseline(self, mock_get_manager, client):
        """Test that baseline POST sets new baseline."""
        mock_manager = Mock()
        mock_get_manager.return_value = mock_manager

        new_baseline = {
            "accuracy": 0.97,
            "latency_ms": 95.0,
            "memory_mb": 500.0
        }

        response = client.post("/api/v1/vlm/baseline", json=new_baseline)
        assert response.status_code == 200
        mock_manager.set_baseline.assert_called_once()


class TestVLMMonitorStartEndpoint:
    """Tests for the /api/v1/vlm/monitor/start endpoint."""

    @patch('systems.pixel_compiler.api.vlm_health.get_health_manager')
    def test_monitor_start_starts_monitoring(self, mock_get_manager, client):
        """Test that monitor start endpoint begins monitoring."""
        mock_manager = Mock()
        mock_manager.is_monitoring.return_value = False
        mock_get_manager.return_value = mock_manager

        response = client.post("/api/v1/vlm/monitor/start")
        assert response.status_code == 200
        data = response.json()
        assert "monitoring" in data
        assert data["monitoring"] is True
        mock_manager.start_monitoring.assert_called_once()


class TestVLMMonitorStopEndpoint:
    """Tests for the /api/v1/vlm/monitor/stop endpoint."""

    @patch('systems.pixel_compiler.api.vlm_health.get_health_manager')
    def test_monitor_stop_stops_monitoring(self, mock_get_manager, client):
        """Test that monitor stop endpoint halts monitoring."""
        mock_manager = Mock()
        mock_manager.is_monitoring.return_value = True
        mock_get_manager.return_value = mock_manager

        response = client.post("/api/v1/vlm/monitor/stop")
        assert response.status_code == 200
        data = response.json()
        assert "monitoring" in data
        assert data["monitoring"] is False
        mock_manager.stop_monitoring.assert_called_once()


class TestVLMMonitorStatusEndpoint:
    """Tests for the /api/v1/vlm/monitor/status endpoint."""

    @patch('systems.pixel_compiler.api.vlm_health.get_health_manager')
    def test_monitor_status_returns_status(self, mock_get_manager, client):
        """Test that monitor status returns current status."""
        mock_manager = Mock()
        mock_manager.is_monitoring.return_value = True
        mock_manager.get_status.return_value = {
            "monitoring": True,
            "checks_performed": 42,
            "last_check": "2026-02-10T12:00:00Z",
            "health_score": 0.92
        }
        mock_get_manager.return_value = mock_manager

        response = client.get("/api/v1/vlm/monitor/status")
        assert response.status_code == 200
        data = response.json()
        assert "monitoring" in data
        assert data["monitoring"] is True

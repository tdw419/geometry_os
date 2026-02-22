"""
Tests for Pattern Detection REST API
"""
import base64
import io
import json
import tempfile
from pathlib import Path
from unittest.mock import Mock, patch

import numpy as np
import pytest
from fastapi.testclient import TestClient
from PIL import Image


@pytest.fixture
def sample_image_bytes():
    """Create a sample PNG image for testing."""
    # Create a simple checkerboard pattern
    img = Image.new('RGB', (64, 64), color='white')
    pixels = img.load()

    for i in range(64):
        for j in range(64):
            if (i // 8 + j // 8) % 2 == 0:
                pixels[i, j] = (255, 255, 255)
            else:
                pixels[i, j] = (0, 0, 0)

    # Save to bytes
    img_bytes = io.BytesIO()
    img.save(img_bytes, format='PNG')
    img_bytes.seek(0)
    return img_bytes.read()


@pytest.fixture
def client():
    """Create a test client for the API."""
    # Import here to avoid import errors if dependencies not installed
    from systems.pixel_compiler.api.main import app
    return TestClient(app)


class TestHealthEndpoint:
    """Tests for the /health endpoint."""

    def test_health_check_returns_ok(self, client):
        """Test that health check returns 200 OK status."""
        response = client.get("/health")
        assert response.status_code == 200

    def test_health_check_returns_status_dict(self, client):
        """Test that health check returns a status dictionary."""
        response = client.get("/health")
        assert response.status_code == 200
        data = response.json()
        assert "status" in data
        assert data["status"] == "ok"

    def test_health_check_includes_version(self, client):
        """Test that health check includes version information."""
        response = client.get("/health")
        assert response.status_code == 200
        data = response.json()
        assert "version" in data


class TestModelsEndpoint:
    """Tests for the /api/v1/models endpoint."""

    def test_models_list_returns_available_models(self, client):
        """Test that models endpoint returns list of available models."""
        response = client.get("/api/v1/models")
        assert response.status_code == 200
        data = response.json()
        assert "models" in data
        assert isinstance(data["models"], list)

    def test_models_includes_edge_detection_methods(self, client):
        """Test that edge detection methods are listed."""
        response = client.get("/api/v1/models")
        assert response.status_code == 200
        data = response.json()
        models = data["models"]
        assert any(m.get("type") == "edge_detection" for m in models)


class TestAnalyzeEndpoint:
    """Tests for the /api/v1/analyze endpoint."""

    def test_analyze_requires_file(self, client):
        """Test that analyze endpoint requires a file upload."""
        response = client.post("/api/v1/analyze", json={"methods": ["edges"]})
        assert response.status_code == 422  # Validation error

    def test_analyze_with_valid_png(self, client, sample_image_bytes):
        """Test analyzing a valid PNG image."""
        files = {"file": ("test.png", sample_image_bytes, "image/png")}
        data = {"methods": json.dumps(["edges"])}

        response = client.post("/api/v1/analyze", files=files, data=data)

        assert response.status_code == 200
        result = response.json()
        assert result["success"] is True
        assert "results" in result

    def test_analyze_supports_sobel_method(self, client, sample_image_bytes):
        """Test analyzing with Sobel edge detection."""
        files = {"file": ("test.png", sample_image_bytes, "image/png")}
        data = {
            "methods": json.dumps(["edges"]),
            "edge_method": "sobel"
        }

        response = client.post("/api/v1/analyze", files=files, data=data)

        assert response.status_code == 200
        result = response.json()
        assert result["success"] is True
        assert "edges" in result["results"]

    def test_analyze_supports_canny_method(self, client, sample_image_bytes):
        """Test analyzing with Canny edge detection."""
        files = {"file": ("test.png", sample_image_bytes, "image/png")}
        data = {
            "methods": json.dumps(["edges"]),
            "edge_method": "canny"
        }

        response = client.post("/api/v1/analyze", files=files, data=data)

        assert response.status_code == 200
        result = response.json()
        assert result["success"] is True
        assert "edges" in result["results"]

    def test_analyze_invalid_method_returns_error(self, client, sample_image_bytes):
        """Test that invalid method returns appropriate error."""
        files = {"file": ("test.png", sample_image_bytes, "image/png")}
        data = {
            "methods": json.dumps(["invalid_method"])
        }

        response = client.post("/api/v1/analyze", files=files, data=data)

        assert response.status_code == 400
        result = response.json()
        assert result["success"] is False
        assert "error" in result

    def test_analyze_invalid_file_type(self, client):
        """Test that non-image file returns appropriate error."""
        files = {"file": ("test.txt", b"not an image", "text/plain")}
        data = {"methods": json.dumps(["edges"])}

        response = client.post("/api/v1/analyze", files=files, data=data)

        assert response.status_code == 400
        result = response.json()
        assert result["success"] is False

    def test_analyze_with_return_overlay(self, client, sample_image_bytes):
        """Test that return_overlay parameter works."""
        files = {"file": ("test.png", sample_image_bytes, "image/png")}
        data = {
            "methods": json.dumps(["edges"]),
            "return_overlay": "true"
        }

        response = client.post("/api/v1/analyze", files=files, data=data)

        assert response.status_code == 200
        result = response.json()
        assert result["success"] is True
        # When overlay is requested, should include overlay data
        assert "overlay" in result["results"].get("edges", {})


class TestBatchEndpoint:
    """Tests for the /api/v1/batch endpoint."""

    def test_batch_requires_files(self, client):
        """Test that batch endpoint requires file uploads."""
        response = client.post("/api/v1/batch", json={"methods": ["edges"]})
        assert response.status_code == 422

    def test_batch_with_multiple_files(self, client, sample_image_bytes):
        """Test batch processing multiple files."""
        files = [
            ("files", ("test1.png", sample_image_bytes, "image/png")),
            ("files", ("test2.png", sample_image_bytes, "image/png")),
        ]
        data = {"methods": json.dumps(["edges"])}

        response = client.post("/api/v1/batch", files=files, data=data)

        assert response.status_code == 200
        result = response.json()
        assert result["success"] is True
        assert "results" in result
        assert len(result["results"]) == 2

    def test_batch_returns_individual_results(self, client, sample_image_bytes):
        """Test that batch processing returns individual file results."""
        files = [
            ("files", ("test1.png", sample_image_bytes, "image/png")),
            ("files", ("test2.png", sample_image_bytes, "image/png")),
        ]
        data = {"methods": json.dumps(["edges"])}

        response = client.post("/api/v1/batch", files=files, data=data)

        assert response.status_code == 200
        result = response.json()
        for file_result in result["results"]:
            assert "file_name" in file_result
            assert "success" in file_result


class TestErrorHandling:
    """Tests for API error handling."""

    def test_404_on_unknown_endpoint(self, client):
        """Test that unknown endpoints return 404."""
        response = client.get("/api/v1/unknown")
        assert response.status_code == 404

    def test_malformed_json_returns_error(self, client, sample_image_bytes):
        """Test that malformed JSON in data returns appropriate error."""
        files = {"file": ("test.png", sample_image_bytes, "image/png")}
        data = {"methods": "not valid json"}

        response = client.post("/api/v1/analyze", files=files, data=data)

        # Should either return 400 or handle gracefully
        assert response.status_code in [200, 400]


class TestAPIModels:
    """Tests for Pydantic models."""

    def test_analysis_request_model_validation(self):
        """Test AnalysisRequest model validation."""
        from systems.pixel_compiler.api.models import AnalysisRequest

        # Valid request
        request = AnalysisRequest(
            methods=["edges"],
            edge_method="sobel",
            return_overlay=True
        )
        assert request.methods == ["edges"]
        assert request.edge_method == "sobel"
        assert request.return_overlay is True

    def test_analysis_response_model_serialization(self):
        """Test AnalysisResponse model serialization."""
        from systems.pixel_compiler.api.models import AnalysisResponse, EdgeDetectionResult

        # Create a valid EdgeDetectionResult
        edge_result = EdgeDetectionResult(
            method="sobel",
            edge_count=100,
            edge_density=0.5,
            strong_edges=[],
            metadata={}
        )

        response = AnalysisResponse(
            success=True,
            image_path="test.png",
            results={"edges": edge_result},
            error=None
        )
        assert response.success is True
        assert response.error is None
        assert response.results is not None

    def test_analysis_request_default_values(self):
        """Test AnalysisRequest default values."""
        from systems.pixel_compiler.api.models import AnalysisRequest

        request = AnalysisRequest(methods=["edges"])
        assert request.edge_method == "sobel"  # Default
        assert request.return_overlay is False  # Default

#!/usr/bin/env python3
"""
Tests for verification infrastructure base classes.

Tests VerificationResult, StepResult, VerificationStatus, and VerificationContext.
"""

import sys
import tempfile
from pathlib import Path
from datetime import datetime
from unittest.mock import patch, MagicMock

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.verification.result import (
    VerificationStatus,
    StepResult,
    VerificationResult,
)
from systems.pixel_compiler.verification.context import VerificationContext


class TestVerificationStatus:
    """Tests for VerificationStatus enum."""

    def test_all_status_values(self):
        """Test all verification status values."""
        assert VerificationStatus.PASS.value == "pass"
        assert VerificationStatus.FAIL.value == "fail"
        assert VerificationStatus.WARNING.value == "warning"
        assert VerificationStatus.SKIP.value == "skip"


class TestStepResult:
    """Tests for StepResult dataclass."""

    def test_create_pass_result(self):
        """Test creating a passing step result."""
        result = StepResult(
            step_name="test_step",
            status=VerificationStatus.PASS,
            message="Check passed",
            duration_ms=1.5
        )
        assert result.step_name == "test_step"
        assert result.status == VerificationStatus.PASS
        assert result.message == "Check passed"
        assert result.duration_ms == 1.5
        assert result.details == {}

    def test_create_fail_result_with_details(self):
        """Test creating a failing step result with details."""
        result = StepResult(
            step_name="check_metadata",
            status=VerificationStatus.FAIL,
            message="Missing required field",
            details={"field": "grid_size"},
            duration_ms=0.5
        )
        assert result.status == VerificationStatus.FAIL
        assert result.details == {"field": "grid_size"}

    def test_is_pass(self):
        """Test is_pass method."""
        pass_result = StepResult(
            step_name="test",
            status=VerificationStatus.PASS,
            message="OK"
        )
        fail_result = StepResult(
            step_name="test",
            status=VerificationStatus.FAIL,
            message="Failed"
        )
        assert pass_result.is_pass() is True
        assert fail_result.is_pass() is False

    def test_to_dict_contains_all_fields(self):
        """Test serialization to dictionary."""
        result = StepResult(
            step_name="structure",
            status=VerificationStatus.PASS,
            message="Valid structure",
            details={"grid_size": 256},
            duration_ms=2.5
        )
        data = result.to_dict()

        assert data["step_name"] == "structure"
        assert data["status"] == "pass"
        assert data["message"] == "Valid structure"
        assert data["details"]["grid_size"] == 256
        assert data["duration_ms"] == 2.5

    def test_from_dict(self):
        """Test deserialization from dictionary."""
        data = {
            "step_name": "metadata",
            "status": "fail",
            "message": "Missing",
            "details": {"key": "format"},
            "duration_ms": 0.3
        }
        result = StepResult.from_dict(data)

        assert result.step_name == "metadata"
        assert result.status == VerificationStatus.FAIL
        assert result.message == "Missing"
        assert result.details == {"key": "format"}


class TestVerificationResult:
    """Tests for VerificationResult dataclass."""

    def test_create_result_with_steps(self):
        """Test creating a verification result with steps."""
        steps = [
            StepResult("step1", VerificationStatus.PASS, "OK"),
            StepResult("step2", VerificationStatus.PASS, "OK"),
        ]
        result = VerificationResult(
            overall_status=VerificationStatus.PASS,
            steps=steps,
            file_path="test.rts.png",
            timestamp=datetime.now()
        )

        assert result.overall_status == VerificationStatus.PASS
        assert len(result.steps) == 2
        assert result.file_path == "test.rts.png"

    def test_pass_result_is_pass(self):
        """Test is_pass returns True for passing result."""
        result = VerificationResult(
            overall_status=VerificationStatus.PASS,
            steps=[],
            file_path="test.png",
            timestamp=datetime.now()
        )
        assert result.is_pass() is True

    def test_fail_result_is_not_pass(self):
        """Test is_pass returns False for failing result."""
        result = VerificationResult(
            overall_status=VerificationStatus.FAIL,
            steps=[StepResult("s1", VerificationStatus.FAIL, "Failed")],
            file_path="test.png",
            timestamp=datetime.now()
        )
        assert result.is_pass() is False

    def test_to_dict_contains_all_fields(self):
        """Test serialization to dictionary."""
        steps = [
            StepResult("step1", VerificationStatus.PASS, "OK"),
            StepResult("step2", VerificationStatus.FAIL, "Bad"),
        ]
        timestamp = datetime(2026, 3, 9, 12, 0, 0)
        result = VerificationResult(
            overall_status=VerificationStatus.FAIL,
            steps=steps,
            file_path="/path/to/file.rts.png",
            timestamp=timestamp
        )
        data = result.to_dict()

        assert data["overall_status"] == "fail"
        assert data["file_path"] == "/path/to/file.rts.png"
        assert data["timestamp"] == "2026-03-09T12:00:00"
        assert len(data["steps"]) == 2
        assert data["summary"]["total"] == 2
        assert data["summary"]["passed"] == 1
        assert data["summary"]["failed"] == 1

    def test_to_json(self):
        """Test JSON serialization."""
        result = VerificationResult(
            overall_status=VerificationStatus.PASS,
            steps=[],
            file_path="test.png",
            timestamp=datetime(2026, 3, 9, 12, 0, 0)
        )
        json_str = result.to_json()
        assert '"overall_status": "pass"' in json_str
        assert '"file_path": "test.png"' in json_str

    def test_format_cli_pass_output(self):
        """Test CLI formatting for passing result."""
        steps = [
            StepResult("structure", VerificationStatus.PASS, "Valid PNG"),
            StepResult("metadata", VerificationStatus.PASS, "Valid metadata"),
        ]
        result = VerificationResult(
            overall_status=VerificationStatus.PASS,
            steps=steps,
            file_path="test.rts.png",
            timestamp=datetime.now()
        )
        output = result.format_cli()

        assert "[PASS]" in output
        assert "test.rts.png" in output
        assert "2/2 passed" in output

    def test_format_cli_fail_output(self):
        """Test CLI formatting for failing result."""
        steps = [
            StepResult("structure", VerificationStatus.PASS, "OK"),
            StepResult("metadata", VerificationStatus.FAIL, "Missing metadata"),
        ]
        result = VerificationResult(
            overall_status=VerificationStatus.FAIL,
            steps=steps,
            file_path="test.rts.png",
            timestamp=datetime.now()
        )
        output = result.format_cli()

        assert "[FAIL]" in output
        assert "1/2 passed" in output
        assert "Missing metadata" in output

    def test_format_cli_verbose(self):
        """Test verbose CLI formatting shows all steps."""
        steps = [
            StepResult("step1", VerificationStatus.PASS, "All good"),
            StepResult("step2", VerificationStatus.PASS, "Also good"),
        ]
        result = VerificationResult(
            overall_status=VerificationStatus.PASS,
            steps=steps,
            file_path="test.png",
            timestamp=datetime.now()
        )
        output = result.format_cli(verbose=True)

        assert "step1" in output
        assert "step2" in output
        assert "All good" in output
        assert "Also good" in output

    def test_from_dict(self):
        """Test deserialization from dictionary."""
        data = {
            "overall_status": "pass",
            "file_path": "test.png",
            "timestamp": "2026-03-09T12:00:00",
            "steps": [
                {"step_name": "s1", "status": "pass", "message": "OK", "details": {}, "duration_ms": 0.0}
            ]
        }
        result = VerificationResult.from_dict(data)

        assert result.overall_status == VerificationStatus.PASS
        assert result.file_path == "test.png"
        assert len(result.steps) == 1

    def test_counts(self):
        """Test pass/fail/warning counts."""
        steps = [
            StepResult("s1", VerificationStatus.PASS, "OK"),
            StepResult("s2", VerificationStatus.PASS, "OK"),
            StepResult("s3", VerificationStatus.FAIL, "Bad"),
            StepResult("s4", VerificationStatus.WARNING, "Warn"),
        ]
        result = VerificationResult(
            overall_status=VerificationStatus.FAIL,
            steps=steps,
            file_path="test.png",
            timestamp=datetime.now()
        )

        assert result.pass_count == 2
        assert result.fail_count == 1
        assert result.warning_count == 1


class TestVerificationContext:
    """Tests for VerificationContext class."""

    def test_context_stores_file_path(self):
        """Test context stores file path."""
        context = VerificationContext(Path("/tmp/test.png"))
        assert context.file_path == Path("/tmp/test.png")

    def test_context_lazy_loads_png_data(self):
        """Test PNG data is lazy loaded."""
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            f.write(b"test data 123")
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)

        # Initially None
        assert context._png_data is None

        # Access triggers load
        data = context.png_data
        assert data == b"test data 123"

        temp_path.unlink()

    def test_context_caches_png_data(self):
        """Test PNG data is cached after first load."""
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            f.write(b"cached data")
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)

        # First access loads
        data1 = context.png_data
        # Second access returns cached
        data2 = context.png_data

        assert data1 is data2
        assert data1 == b"cached data"

        temp_path.unlink()

    def test_context_handles_missing_file(self):
        """Test context handles missing file gracefully."""
        context = VerificationContext(Path("/nonexistent/file.png"))

        data = context.png_data
        errors = context.load_errors

        assert data is None
        assert len(errors) > 0
        assert "not found" in errors[0].lower() or "cannot" in errors[0].lower()

    def test_context_lazy_loads_image(self):
        """Test image is lazy loaded with PIL."""
        import numpy as np
        from PIL import Image

        # Create a minimal valid PNG
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            img = Image.fromarray(np.zeros((64, 64, 4), dtype=np.uint8), 'RGBA')
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)

        # Initially None
        assert context._image is None

        # Access triggers load
        loaded_img = context.image
        assert loaded_img is not None
        assert loaded_img.size == (64, 64)

        temp_path.unlink()

    def test_context_lazy_loads_metadata(self):
        """Test metadata is lazy loaded."""
        import numpy as np
        from PIL import Image
        from PIL import PngImagePlugin
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata

        # Create PNG with PixelRTS metadata
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            img = Image.fromarray(np.zeros((256, 256, 4), dtype=np.uint8), 'RGBA')
            metadata = PixelRTSMetadata.create_metadata(grid_size=256)
            encoded = PixelRTSMetadata.encode_png_text(metadata)
            png_info = PngImagePlugin.PngInfo()
            png_info.add_text('PixelRTS', encoded.decode('utf-8'))
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)

        # Initially None
        assert context._metadata is None

        # Access triggers load
        loaded_metadata = context.metadata
        assert loaded_metadata is not None
        assert "format" in loaded_metadata
        assert "grid_size" in loaded_metadata

        temp_path.unlink()

    def test_get_metadata_method(self):
        """Test get_metadata() method returns same as property."""
        context = VerificationContext(Path("/tmp/test.png"))
        assert context.get_metadata() == context.metadata

    def test_get_image_method(self):
        """Test get_image() method returns same as property."""
        context = VerificationContext(Path("/tmp/test.png"))
        assert context.get_image() == context.image

    def test_get_png_data_method(self):
        """Test get_png_data() method returns same as property."""
        context = VerificationContext(Path("/tmp/test.png"))
        assert context.get_png_data() == context.png_data

    def test_clear_cache(self):
        """Test clear_cache() resets cached data."""
        with tempfile.NamedTemporaryFile(suffix=".png", delete=False) as f:
            f.write(b"test data")
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)

        # Load data
        _ = context.png_data
        assert context._png_data is not None

        # Clear cache
        context.clear_cache()
        assert context._png_data is None

        temp_path.unlink()

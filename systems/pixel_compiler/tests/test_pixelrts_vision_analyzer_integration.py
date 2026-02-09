#!/usr/bin/env python3
"""
Integration tests for PixelRTS Vision Analyzer with Vision Model Client.
"""

import pytest
from pathlib import Path
from unittest.mock import Mock, patch
import sys

# Add parent directory to path to import modules
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer


def test_analyzer_performs_vision_analysis():
    """Test that analyzer can perform vision model analysis."""
    rts_path = Path("tests/fixtures/ubuntu_kernel.rts.png")
    if not rts_path.exists():
        pytest.skip("Test fixture not found")

    analyzer = PixelRTSVisionAnalyzer(rts_path)

    # Mock the vision client
    with patch('pixelrts_vision_analyzer.VisionModelClient') as mock_client:
        mock_instance = Mock()
        mock_instance.analyze.return_value = "Analysis: High entropy in upper left, patterns suggest ELF header."
        mock_instance.build_analysis_prompt.return_value = "Test prompt"
        mock_client.return_value = mock_instance

        result = analyzer.analyze_with_vision_model()

        assert result is not None
        assert "High entropy" in result
        mock_instance.analyze.assert_called_once()


def test_analyzer_parses_vision_findings():
    """Test that analyzer can parse structured findings from vision model."""
    rts_path = Path("tests/fixtures/ubuntu_kernel.rts.png")
    if not rts_path.exists():
        pytest.skip("Test fixture not found")

    analyzer = PixelRTSVisionAnalyzer(rts_path)

    mock_response = """
    Structural Patterns:
    - Repeated blocks at coordinates (0-200, 0-500)
    - Grid-like structure in center region

    Entropy Distribution:
    - High: Upper-left quadrant
    - Low: Bottom-right region

    Anomalies:
    - Unexpected solid color block at (1500, 1800)
    """

    findings = analyzer.parse_vision_findings(mock_response)

    assert "structural_patterns" in findings
    assert "entropy_distribution" in findings
    assert "anomalies" in findings
    assert len(findings["anomalies"]) > 0


def test_analyzer_infers_kernel_type():
    """Test that analyzer correctly infers kernel artifact type."""
    # Create a mock analyzer with kernel-like metadata
    with patch('pixelrts_vision_analyzer.PixelRTSVisionAnalyzer') as MockAnalyzer:
        mock_instance = Mock()
        mock_instance.metadata = {"format": "PixelRTS-2.0"}
        mock_instance.rts_path = Path("vmlinuz.rts.png")
        mock_instance._infer_artifact_type = PixelRTSVisionAnalyzer._infer_artifact_type.__get__(
            mock_instance, MockAnalyzer
        )

        artifact_type = mock_instance._infer_artifact_type()
        assert artifact_type == "kernel"


def test_analyzer_infers_initrd_type():
    """Test that analyzer correctly infers initrd artifact type."""
    with patch('pixelrts_vision_analyzer.PixelRTSVisionAnalyzer') as MockAnalyzer:
        mock_instance = Mock()
        mock_instance.metadata = {"format": "PixelRTS-2.0"}
        mock_instance.rts_path = Path("initrd.rts.png")
        mock_instance._infer_artifact_type = PixelRTSVisionAnalyzer._infer_artifact_type.__get__(
            mock_instance, MockAnalyzer
        )

        artifact_type = mock_instance._infer_artifact_type()
        assert artifact_type == "initrd"


def test_analyzer_infers_wasm_type():
    """Test that analyzer correctly infers wasm artifact type."""
    with patch('pixelrts_vision_analyzer.PixelRTSVisionAnalyzer') as MockAnalyzer:
        mock_instance = Mock()
        mock_instance.metadata = {"format": "PixelRTS-2.0"}
        mock_instance.rts_path = Path("module.wasm.rts.png")
        mock_instance._infer_artifact_type = PixelRTSVisionAnalyzer._infer_artifact_type.__get__(
            mock_instance, MockAnalyzer
        )

        artifact_type = mock_instance._infer_artifact_type()
        assert artifact_type == "wasm"


def test_analyzer_generates_findings_overlay():
    """Test that analyzer can create annotated overlay with findings."""
    rts_path = Path("tests/fixtures/ubuntu_kernel.rts.png")
    if not rts_path.exists():
        pytest.skip("Test fixture not found")

    analyzer = PixelRTSVisionAnalyzer(rts_path)

    findings = {
        "structural_patterns": ["ELF header pattern detected", "Section boundaries visible"],
        "entropy_distribution": ["High entropy in text section", "Low entropy in bss"],
        "anomalies": ["Unexpected padding at offset 0x1000"],
        "binary_format": ["ELF 64-bit LSB executable"]
    }

    import tempfile
    with tempfile.TemporaryDirectory() as tmpdir:
        overlay_path = analyzer.generate_findings_overlay(findings, output_dir=tmpdir)

        assert overlay_path.exists()
        assert overlay_path.suffix == ".png"
        assert overlay_path.parent == Path(tmpdir)

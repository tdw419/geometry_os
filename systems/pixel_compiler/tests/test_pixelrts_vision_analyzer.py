"""
Tests for PixelRTS Vision Analyzer

Tests the vision analyzer's ability to extract visual information from
PixelRTS container images and prepare them for vision model analysis.
"""

import pytest
import numpy as np
from pathlib import Path
import tempfile
import json
from PIL import Image
import io
import base64

from pixelrts_vision_analyzer import PixelRTSVisionAnalyzer


# Helper function to create test RTS PNG files
def create_test_rts_png(path, size=(64, 64), metadata=None, pattern="solid"):
    """
    Create a test RTS PNG file with optional metadata sidecar.

    Args:
        path: Path to save the PNG file
        size: Tuple of (width, height)
        metadata: Optional metadata dict (creates default if None)
        pattern: "solid" or "gradient" for pixel pattern
    """
    # Create image
    if pattern == "gradient":
        # Create gradient pattern
        arr = np.zeros((size[1], size[0], 4), dtype=np.uint8)
        for y in range(size[1]):
            for x in range(size[0]):
                arr[y, x] = [x * 255 // size[0], y * 255 // size[1], 128, 255]
        image = Image.fromarray(arr, 'RGBA')
    else:
        # Solid color with some variation
        color = (128, 64, 32, 255)
        image = Image.new('RGBA', size, color=color)

    # Save PNG
    png_buffer = io.BytesIO()
    image.save(png_buffer, format='PNG')

    with open(path, 'wb') as f:
        f.write(png_buffer.getvalue())

    # Create metadata sidecar
    if metadata is None:
        metadata = {
            "format": "PixelRTS-2.0",
            "grid_size": size[0],
            "encoding": {"type": "RGBA-dense", "bytes_per_pixel": 4},
            "data_size": size[0] * size[1] * 4
        }

    # Handle both .rts.png.meta.json and .meta.json patterns
    meta_path = Path(str(path) + ".meta.json")
    if not meta_path.parent.exists():
        # For paths like test.rts.png, try test.meta.json instead
        path_str = str(path)
        if path_str.endswith('.rts.png'):
            meta_path = Path(path_str.replace('.rts.png', '.meta.json'))
        else:
            meta_path = Path(path_str + '.meta.json')

    with open(meta_path, 'w') as f:
        json.dump(metadata, f)


class TestAnalyzerInitialization:
    """Test analyzer initialization with various RTS PNG formats."""

    def test_analyzer_initializes_with_rts_png(self, tmp_path):
        """Test analyzer can be initialized with a valid .rts.png file."""
        # Create a test RTS PNG with metadata sidecar
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(64, 64))

        # Should initialize without error
        analyzer = PixelRTSVisionAnalyzer(str(rts_path))

        assert analyzer.rts_path == str(rts_path)
        assert analyzer.image is not None
        assert analyzer.metadata is not None

    def test_analyzer_initializes_with_meta_json_sidecar(self, tmp_path):
        """Test analyzer loads metadata from .meta.json sidecar."""
        rts_path = tmp_path / "test.rts.png"
        metadata = {
            "format": "PixelRTS-2.0",
            "grid_size": 32,
            "encoding": {"type": "RGBA-dense"},
            "data_size": 1024
        }
        create_test_rts_png(rts_path, size=(32, 32), metadata=metadata)

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))

        assert analyzer.metadata["grid_size"] == 32
        assert analyzer.metadata["encoding"]["type"] == "RGBA-dense"

    def test_analyzer_fallback_to_png_metadata(self, tmp_path):
        """Test analyzer falls back to PNG tEXt chunks when no sidecar."""
        rts_path = tmp_path / "test_no_sidecar.rts.png"

        # Create PNG with embedded metadata but no sidecar
        image = Image.new('RGBA', (32, 32), color=(128, 64, 32, 255))
        png_buffer = io.BytesIO()

        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        metadata_text = json.dumps({
            "format": "PixelRTS-2.0",
            "grid_size": 32,
            "encoding": {"type": "RGBA-dense"}
        })
        pnginfo.add_text("PixelRTS", f"PixelRTS{metadata_text}")

        image.save(png_buffer, format='PNG', pnginfo=pnginfo)

        with open(rts_path, 'wb') as f:
            f.write(png_buffer.getvalue())

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))

        # Should have loaded metadata from PNG
        assert analyzer.metadata is not None

    def test_analyzer_raises_on_invalid_path(self, tmp_path):
        """Test analyzer raises FileNotFoundError for non-existent file."""
        with pytest.raises(FileNotFoundError):
            PixelRTSVisionAnalyzer(str(tmp_path / "nonexistent.rts.png"))

    def test_analyzer_handles_corrupted_png(self, tmp_path):
        """Test analyzer handles corrupted PNG files gracefully."""
        rts_path = tmp_path / "corrupted.rts.png"

        # Write invalid PNG data
        with open(rts_path, 'wb') as f:
            f.write(b'This is not a PNG file')

        with pytest.raises(ValueError):
            PixelRTSVisionAnalyzer(str(rts_path))


class TestVisualSummary:
    """Test visual summary extraction."""

    def test_analyzer_extracts_visual_summary(self, tmp_path):
        """Test get_visual_summary returns correct dimensions and stats."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(128, 128))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        summary = analyzer.get_visual_summary()

        assert summary["width"] == 128
        assert summary["height"] == 128
        assert summary["total_pixels"] == 128 * 128
        assert summary["channels"] == 4  # RGBA
        assert "aspect_ratio" in summary

    def test_analyzer_summary_includes_grid_size(self, tmp_path):
        """Test summary includes grid_size from metadata."""
        rts_path = tmp_path / "test.rts.png"
        metadata = {"grid_size": 64, "encoding": {"type": "RGBA-dense"}}
        create_test_rts_png(rts_path, size=(64, 64), metadata=metadata)

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        summary = analyzer.get_visual_summary()

        assert summary["grid_size"] == 64

    def test_analyzer_summary_includes_data_stats(self, tmp_path):
        """Test summary includes basic data statistics."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(64, 64))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        summary = analyzer.get_visual_summary()

        # Check for basic statistics
        assert "data_size" in summary or "size_bytes" in summary
        assert "format" in summary


class TestEntropyOverlay:
    """Test entropy heatmap generation."""

    def test_analyzer_generates_entropy_overlay(self, tmp_path):
        """Test generate_entropy_overlay creates heatmap visualization."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(64, 64))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        output_dir = tmp_path / "output"

        overlay_path = analyzer.generate_entropy_overlay(str(output_dir))

        # Check file was created
        assert Path(overlay_path).exists()
        assert overlay_path.endswith(".png")
        assert "entropy_overlay" in overlay_path

        # Verify it's a valid PNG
        with Image.open(overlay_path) as img:
            assert img.format == 'PNG'
            # Matplotlib figures include colorbar and labels, so image is larger
            assert img.size[0] >= 64 and img.size[1] >= 64

    def test_entropy_overlay_uses_colormap(self, tmp_path):
        """Test entropy overlay applies color mapping."""
        rts_path = tmp_path / "test.rts.png"
        # Create image with varying pixel values
        create_test_rts_png(rts_path, size=(32, 32), pattern="gradient")

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        output_dir = tmp_path / "output"

        overlay_path = analyzer.generate_entropy_overlay(
            str(output_dir),
            colormap="viridis"
        )

        # Verify output
        assert Path(overlay_path).exists()

    def test_entropy_overlay_creates_output_dir(self, tmp_path):
        """Test entropy overlay creates output directory if needed."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(32, 32))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        output_dir = tmp_path / "new_dir" / "nested"

        # Directory doesn't exist yet
        assert not output_dir.exists()

        overlay_path = analyzer.generate_entropy_overlay(str(output_dir))

        # Should create directory and file
        assert Path(overlay_path).exists()


class TestVisionModelPreparation:
    """Test preparation for vision model input."""

    def test_prepare_for_vision_model_returns_tuple(self, tmp_path):
        """Test prepare_for_vision_model returns (image, base64) tuple."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(64, 64))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        image, b64_string = analyzer.prepare_for_vision_model(max_size=512)

        assert image is not None
        assert isinstance(b64_string, str)
        assert len(b64_string) > 0

    def test_prepare_respects_max_size(self, tmp_path):
        """Test prepare_for_vision_model resizes large images."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(1024, 1024))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        image, b64_string = analyzer.prepare_for_vision_model(max_size=512)

        # Image should be resized to fit within max_size
        assert max(image.size) <= 512

    def test_prepare_no_resize_small_image(self, tmp_path):
        """Test prepare_for_vision_model doesn't resize small images."""
        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(64, 64))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        image, b64_string = analyzer.prepare_for_vision_model(max_size=512)

        # Small image should not be resized
        assert image.size == (64, 64)

    def test_base64_is_valid_png(self, tmp_path):
        """Test base64 string decodes to valid PNG."""

        rts_path = tmp_path / "test.rts.png"
        create_test_rts_png(rts_path, size=(32, 32))

        analyzer = PixelRTSVisionAnalyzer(str(rts_path))
        image, b64_string = analyzer.prepare_for_vision_model(max_size=512)

        # Decode and verify
        decoded = base64.b64decode(b64_string)
        assert decoded[:8] == b'\x89PNG\r\n\x1a\n'  # PNG signature

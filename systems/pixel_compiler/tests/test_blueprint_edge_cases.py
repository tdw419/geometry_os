"""
Edge Case Tests for PixelRTS Blueprint Layer

Tests error handling for:
- Corrupted PNG files
- Missing sidecar files
- Zero-byte files
- Non-ELF binaries (MZ, ZIP, RIFF, etc.)
- Negative coordinates
- Nonexistent image paths
"""

import json
import pytest
from pathlib import Path
from io import BytesIO
from dataclasses import asdict

from systems.pixel_compiler.pixelrts_blueprint import (
    PixelRTSBlueprint, Component, ComponentType, HilbertRange,
    MemoryRegion, SecurityInfo
)
from systems.pixel_compiler.pixelrts_blueprint_viewer import BlueprintViewer
from systems.pixel_compiler.pixelrts_blueprint_analyzer import (
    BlueprintAnalyzer, EntropyRegion
)
from systems.pixel_compiler.pixelrts_blueprint_exceptions import (
    EmptyDataError,
    InvalidBinaryFormatError,
    ImageLoadError
)

try:
    from PIL import Image
    PIL_AVAILABLE = True
except ImportError:
    PIL_AVAILABLE = False


# ============================================================================
# Test Fixtures
# ============================================================================

@pytest.fixture
def temp_dir(tmp_path):
    """Create temporary directory for test files."""
    return tmp_path


@pytest.fixture
def valid_png(temp_dir):
    """Create a valid PNG file for testing."""
    png_path = temp_dir / "valid.rts.png"
    img = Image.new('RGBA', (256, 256), color=(128, 128, 128, 255))
    img.save(png_path)
    return str(png_path)


@pytest.fixture
def valid_blueprint():
    """Create a valid blueprint for testing."""
    return PixelRTSBlueprint(
        version="1.0",
        system_name="Test System",
        system_type="kernel",
        architecture="x86_64",
        components=[
            Component(
                id="test_component",
                type=ComponentType.EXECUTABLE,
                description="Test component",
                hilbert_range=HilbertRange(
                    start_index=0,
                    end_index=100,
                    pixel_start=(0, 0),
                    pixel_end=(10, 10)
                ),
                entropy_profile="low",
                visual_hint="red_dominant"
            )
        ],
        memory_map=[
            MemoryRegion(region=".text", permissions="rx")
        ],
        entry_point="0x1000"
    )


@pytest.fixture
def blueprint_viewer():
    """Create BlueprintViewer instance."""
    return BlueprintViewer()


@pytest.fixture
def blueprint_analyzer():
    """Create BlueprintAnalyzer instance."""
    return BlueprintAnalyzer()


# ============================================================================
# Corrupted PNG File Tests
# ============================================================================

class TestCorruptedPng:
    """Test handling of corrupted PNG files."""

    def test_corrupted_png_header(self, temp_dir, blueprint_viewer):
        """Test that corrupted PNG header is handled gracefully."""
        corrupted_path = temp_dir / "corrupted.rts.png"

        # Write invalid PNG data
        with open(corrupted_path, 'w') as f:
            f.write("This is not a PNG file")

        # Should return None, not raise exception
        result = blueprint_viewer.load_blueprint_from_png(str(corrupted_path))
        assert result is None

    def test_truncated_png_data(self, temp_dir, blueprint_viewer):
        """Test that truncated PNG data is handled gracefully."""
        truncated_path = temp_dir / "truncated.rts.png"

        # Write valid PNG header but truncate data
        with open(truncated_path, 'wb') as f:
            f.write(b'\x89PNG\r\n\x1a\n')  # PNG signature
            f.write(b'Incomplete data')

        # Should return None, not raise exception
        result = blueprint_viewer.load_blueprint_from_png(str(truncated_path))
        assert result is None

    def test_render_overlay_with_corrupted_png(self, temp_dir, blueprint_viewer, valid_blueprint):
        """Test that render_overlay handles corrupted source image."""
        corrupted_path = temp_dir / "corrupted_source.png"
        output_path = temp_dir / "output.png"

        # Write invalid PNG data
        with open(corrupted_path, 'w') as f:
            f.write("Not a PNG")

        # Should raise ImageLoadError
        with pytest.raises((ImageLoadError, IOError)):
            blueprint_viewer.render_overlay(
                str(corrupted_path),
                valid_blueprint,
                str(output_path)
            )


# ============================================================================
# Missing Sidecar File Tests
# ============================================================================

class TestMissingSidecar:
    """Test handling of missing sidecar files."""

    def test_load_blueprint_from_sidecar_missing(self, temp_dir, blueprint_viewer):
        """Test loading from nonexistent sidecar returns None."""
        rts_path = str(temp_dir / "nonexistent.rts.png")

        result = blueprint_viewer.load_blueprint_from_sidecar(rts_path)
        assert result is None

    def test_load_blueprint_from_sidecar_empty_dir(self, temp_dir, blueprint_viewer):
        """Test loading from empty directory."""
        rts_path = str(temp_dir / "empty.rts.png")

        result = blueprint_viewer.load_blueprint_from_sidecar(rts_path)
        assert result is None

    def test_load_blueprint_both_sources_missing(self, temp_dir, blueprint_viewer):
        """Test load_blueprint when both sources are missing."""
        rts_path = str(temp_dir / "missing.rts.png")

        result = blueprint_viewer.load_blueprint(rts_path)
        assert result is None


# ============================================================================
# Zero-Byte File Tests
# ============================================================================

class TestZeroByteFiles:
    """Test handling of zero-byte files."""

    def test_zero_byte_png(self, temp_dir, blueprint_viewer):
        """Test that zero-byte PNG file is handled gracefully."""
        zero_path = temp_dir / "zero.rts.png"
        zero_path.touch()  # Create empty file

        result = blueprint_viewer.load_blueprint_from_png(str(zero_path))
        assert result is None

    def test_zero_byte_sidecar(self, temp_dir, blueprint_viewer):
        """Test that zero-byte sidecar file is handled gracefully."""
        zero_path = temp_dir / "zero.rts.png.blueprint.json"
        zero_path.touch()  # Create empty file

        # Create valid PNG to pair with
        png_path = temp_dir / "zero.rts.png"
        img = Image.new('RGBA', (256, 256))
        img.save(png_path)

        result = blueprint_viewer.load_blueprint_from_sidecar(str(png_path))
        assert result is None

    def test_analyze_zero_byte_data(self, blueprint_analyzer):
        """Test that analyzing zero-byte data returns empty blueprint."""
        result = blueprint_analyzer.analyze(b"")

        assert isinstance(result, PixelRTSBlueprint)
        assert len(result.components) == 0
        assert result.system_name == ""
        assert result.architecture == ""


# ============================================================================
# Non-ELF Binary Tests
# ============================================================================

class TestNonElfBinaries:
    """Test handling of non-ELF binary formats."""

    def test_analyze_mz_binary(self, blueprint_analyzer):
        """Test analyzing MZ (Windows PE) binary."""
        # MZ header
        mz_data = b'MZ\x90\x00' + b'\x00' * 100

        result = blueprint_analyzer.analyze(mz_data)

        # Should fallback to entropy analysis
        assert isinstance(result, PixelRTSBlueprint)
        assert len(result.components) >= 0

    def test_analyze_zip_archive(self, blueprint_analyzer):
        """Test analyzing ZIP archive."""
        # ZIP header
        zip_data = b'PK\x03\x04' + b'\x00' * 100

        result = blueprint_analyzer.analyze(zip_data)

        # Should fallback to entropy analysis
        assert isinstance(result, PixelRTSBlueprint)
        assert len(result.components) >= 0

    def test_analyze_riff_wave(self, blueprint_analyzer):
        """Test analyzing RIFF WAVE file."""
        # RIFF header
        riff_data = b'RIFF' + b'\x00' * 12

        result = blueprint_analyzer.analyze(riff_data)

        # Should fallback to entropy analysis
        assert isinstance(result, PixelRTSBlueprint)
        assert len(result.components) >= 0

    def test_analyze_elf_with_invalid_structure(self, blueprint_analyzer):
        """Test analyzing ELF with invalid structure."""
        # ELF header but invalid rest
        invalid_elf = b'\x7fELF' + b'\x00' * 50

        result = blueprint_analyzer.analyze(invalid_elf)

        # Should fallback to entropy analysis
        assert isinstance(result, PixelRTSBlueprint)

    def test_is_elf_binary_too_short(self, blueprint_analyzer):
        """Test is_elf_binary with data shorter than header."""
        result = blueprint_analyzer.is_elf_binary(b'EL')
        assert result is False

    def test_is_elf_binary_wrong_magic(self, blueprint_analyzer):
        """Test is_elf_binary with wrong magic bytes."""
        result = blueprint_analyzer.is_elf_binary(b'MZ\x90\x00')
        assert result is False

    def test_is_elf_binary_valid(self, blueprint_analyzer):
        """Test is_elf_binary with valid ELF magic."""
        result = blueprint_analyzer.is_elf_binary(b'\x7fELF')
        assert result is True


# ============================================================================
# Negative Coordinate Tests
# ============================================================================

class TestNegativeCoordinates:
    """Test handling of negative coordinates."""

    def test_hilbert_range_with_negative_start(self):
        """Test HilbertRange with negative start index."""
        # Dataclass allows creation, but we can verify the value is stored
        hr = HilbertRange(
            start_index=-1,
            end_index=100,
            pixel_start=(-1, 0),
            pixel_end=(10, 10)
        )
        assert hr.start_index == -1
        assert hr.end_index == 100

    def test_hilbert_range_with_negative_pixel_coords(self):
        """Test HilbertRange with negative pixel coordinates."""
        # Should allow creation but handle gracefully in operations
        hr = HilbertRange(
            start_index=0,
            end_index=100,
            pixel_start=(-5, -10),
            pixel_end=(10, 10)
        )

        assert hr.pixel_start == (-5, -10)
        assert hr.pixel_end == (10, 10)

    def test_component_with_negative_coords_serialization(self):
        """Test that component with negative coords serializes correctly."""
        component = Component(
            id="test",
            type=ComponentType.DATA,
            description="Test",
            hilbert_range=HilbertRange(
                start_index=0,
                end_index=100,
                pixel_start=(-1, -1),
                pixel_end=(10, 10)
            ),
            entropy_profile="low",
            visual_hint="gray"
        )

        # Should serialize without error
        blueprint = PixelRTSBlueprint(components=[component])
        data_dict = blueprint.to_dict()

        assert data_dict["components"][0]["hilbert_range"]["pixel_start"] == [-1, -1]


# ============================================================================
# Nonexistent Path Tests
# ============================================================================

class TestNonexistentPaths:
    """Test handling of nonexistent file paths."""

    def test_load_blueprint_nonexistent_path(self, blueprint_viewer):
        """Test loading blueprint from nonexistent path."""
        result = blueprint_viewer.load_blueprint("/nonexistent/path/to/file.rts.png")
        assert result is None

    def test_render_overlay_nonexistent_source(self, temp_dir, blueprint_viewer, valid_blueprint):
        """Test render overlay with nonexistent source image."""
        output_path = temp_dir / "output.png"

        with pytest.raises((FileNotFoundError, IOError)):
            blueprint_viewer.render_overlay(
                "/nonexistent/source.png",
                valid_blueprint,
                str(output_path)
            )

    def test_create_interactive_html_nonexistent_source(self, temp_dir, blueprint_viewer, valid_blueprint):
        """Test interactive HTML with nonexistent source (should still work)."""
        output_path = temp_dir / "output.html"

        # HTML generation should work even if source doesn't exist
        # (it only uses the path for display name)
        result = blueprint_viewer.create_interactive_html(
            "/nonexistent/source.png",
            valid_blueprint,
            str(output_path)
        )

        assert result == str(output_path)
        assert Path(output_path).exists()


# ============================================================================
# Malformed JSON Tests
# ============================================================================

class TestMalformedJson:
    """Test handling of malformed JSON in sidecar files."""

    def test_malformed_json_sidecar(self, temp_dir, blueprint_viewer):
        """Test that malformed JSON sidecar is handled gracefully."""
        png_path = temp_dir / "test.rts.png"
        img = Image.new('RGBA', (256, 256))
        img.save(png_path)

        sidecar_path = temp_dir / "test.rts.png.blueprint.json"
        with open(sidecar_path, 'w') as f:
            f.write("{ invalid json }")

        result = blueprint_viewer.load_blueprint_from_sidecar(str(png_path))
        assert result is None

    def test_valid_json_invalid_schema(self, temp_dir, blueprint_viewer):
        """Test that valid JSON with invalid schema is handled."""
        png_path = temp_dir / "test.rts.png"
        img = Image.new('RGBA', (256, 256))
        img.save(png_path)

        sidecar_path = temp_dir / "test.rts.png.blueprint.json"
        with open(sidecar_path, 'w') as f:
            json.dump({"invalid": "schema"}, f)

        # Should handle gracefully - either return None or partial blueprint
        result = blueprint_viewer.load_blueprint_from_sidecar(str(png_path))
        # Behavior may vary, but should not crash


# ============================================================================
# Empty Component List Tests
# ============================================================================

class TestEmptyComponents:
    """Test handling of blueprints with no components."""

    def test_empty_blueprint_render_overlay(self, temp_dir, valid_png, blueprint_viewer):
        """Test rendering overlay with empty blueprint."""
        empty_blueprint = PixelRTSBlueprint()
        output_path = temp_dir / "output.png"

        result = blueprint_viewer.render_overlay(
            valid_png,
            empty_blueprint,
            str(output_path)
        )

        assert result == str(output_path)
        assert Path(output_path).exists()

    def test_empty_blueprint_interactive_html(self, temp_dir, valid_png, blueprint_viewer):
        """Test interactive HTML with empty blueprint."""
        empty_blueprint = PixelRTSBlueprint()
        output_path = temp_dir / "output.html"

        result = blueprint_viewer.create_interactive_html(
            valid_png,
            empty_blueprint,
            str(output_path)
        )

        assert result == str(output_path)
        assert Path(output_path).exists()

    def test_empty_blueprint_serialization(self):
        """Test that empty blueprint serializes correctly."""
        empty = PixelRTSBlueprint()

        data = empty.to_dict()
        assert data["components"] == []
        assert data["memory_map"] == []

        # Round-trip
        restored = PixelRTSBlueprint.from_dict(data)
        assert len(restored.components) == 0


# ============================================================================
# Large Data Tests
# ============================================================================

class TestLargeData:
    """Test handling of large data inputs."""

    def test_analyze_large_binary(self, blueprint_analyzer):
        """Test analyzing a large binary (10MB)."""
        large_data = b'\x7fELF' + b'\x00' * (10 * 1024 * 1024)

        result = blueprint_analyzer.analyze(large_data, system_name="Large")

        assert isinstance(result, PixelRTSBlueprint)
        assert result.system_name == "Large"

    def test_entropy_calculation_large_window(self, blueprint_analyzer):
        """Test entropy calculation with very large window."""
        large_data = bytes(range(256)) * 10000  # 2.56 MB

        regions = blueprint_analyzer.calculate_entropy_regions(
            large_data,
            window_size=1024 * 1024  # 1MB window
        )

        assert len(regions) > 0
        assert all(isinstance(r, EntropyRegion) for r in regions)


# ============================================================================
# Edge Case: None and Invalid Inputs
# ============================================================================

class TestNoneAndInvalidInputs:
    """Test handling of None and invalid inputs."""

    def test_analyze_none_data(self, blueprint_analyzer):
        """Test that None data is handled."""
        with pytest.raises(EmptyDataError):
            blueprint_analyzer.analyze(None)

    def test_blueprint_to_json_with_none_fields(self):
        """Test JSON serialization with None fields."""
        blueprint = PixelRTSBlueprint(
            system_name=None,
            architecture=None,
            entry_point=None
        )

        # Should handle None values
        data = blueprint.to_dict()
        assert data["system_name"] is None
        assert data["architecture"] is None
        assert data["entry_point"] is None

    def test_get_color_from_unknown_hint(self, blueprint_viewer):
        """Test get_color_from_hint with unknown hint."""
        color = blueprint_viewer.get_color_from_hint("unknown_color")
        assert color == (255, 255, 255, 255)  # Default white


# ============================================================================
# Edge Case: Special Characters in Paths
# ============================================================================

class TestSpecialCharacterPaths:
    """Test handling of paths with special characters."""

    def test_path_with_spaces(self, temp_dir, blueprint_viewer):
        """Test path with spaces."""
        png_path = temp_dir / "file with spaces.rts.png"
        img = Image.new('RGBA', (256, 256))
        img.save(png_path)

        result = blueprint_viewer.load_blueprint_from_png(str(png_path))
        assert result is None  # No blueprint, but should not crash

    def test_path_with_unicode(self, temp_dir, blueprint_viewer):
        """Test path with unicode characters."""
        png_path = temp_dir / "file_测试.rts.png"
        img = Image.new('RGBA', (256, 256))
        img.save(png_path)

        result = blueprint_viewer.load_blueprint_from_png(str(png_path))
        assert result is None  # No blueprint, but should not crash


# ============================================================================
# Run tests if executed directly
# ============================================================================

if __name__ == "__main__":
    pytest.main([__file__, "-v"])

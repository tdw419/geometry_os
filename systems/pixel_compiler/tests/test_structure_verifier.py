#!/usr/bin/env python3
"""
Tests for StructureVerifier.

Tests PNG structure validation, chunk verification, and metadata checks.
"""

import sys
import tempfile
from pathlib import Path

import numpy as np
from PIL import Image
from PIL import PngImagePlugin
import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.verification.structure_verifier import StructureVerifier
from systems.pixel_compiler.verification.context import VerificationContext
from systems.pixel_compiler.verification.result import VerificationStatus
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata


class TestStructureVerifier:
    """Tests for StructureVerifier class."""

    @pytest.fixture
    def verifier(self):
        """Create a StructureVerifier instance."""
        return StructureVerifier()

    @pytest.fixture
    def valid_rts_png(self):
        """Create a valid .rts.png file for testing."""
        size = 256
        data = np.zeros((size, size, 4), dtype=np.uint8)
        for i in range(size):
            for j in range(size):
                data[i, j] = [(i * 255) // size, (j * 255) // size, 128, 255]

        img = Image.fromarray(data, 'RGBA')

        # Create proper PixelRTS v2 metadata
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path

        # Cleanup
        if temp_path.exists():
            temp_path.unlink()

    def test_name_and_description(self, verifier):
        """Test verifier has name and description."""
        assert verifier.name == "structure"
        assert "PNG structure" in verifier.description
        assert "PixelRTS" in verifier.description

    def test_valid_rts_png_passes(self, verifier, valid_rts_png):
        """Test that a valid .rts.png file passes verification."""
        context = VerificationContext(valid_rts_png)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.PASS
        assert "Valid PNG structure" in result.message
        assert result.details["grid_size"] == 256
        assert "format_version" in result.details

    def test_invalid_png_signature_fails(self, verifier):
        """Test that invalid PNG signature fails."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            f.write(b'NOT_A_VALID_PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "Invalid PNG signature" in result.message
        assert "expected" in result.details
        assert "actual" in result.details

        temp_path.unlink()

    def test_non_square_image_fails(self, verifier):
        """Test that non-square image fails."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            # Create 100x200 image (not square)
            img = Image.fromarray(np.zeros((100, 200, 4), dtype=np.uint8), 'RGBA')
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "not square" in result.message
        assert result.details["width"] == 200
        assert result.details["height"] == 100

        temp_path.unlink()

    def test_non_power_of_two_fails(self, verifier):
        """Test that non-power-of-2 size fails."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            # Create 100x100 image (100 is not power of 2)
            img = Image.fromarray(np.zeros((100, 100, 4), dtype=np.uint8), 'RGBA')
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "not a power of 2" in result.message
        assert result.details["grid_size"] == 100

        temp_path.unlink()

    def test_missing_metadata_fails(self, verifier):
        """Test that missing PixelRTS metadata fails."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            # Valid PNG but no PixelRTS metadata
            img = Image.fromarray(np.zeros((256, 256, 4), dtype=np.uint8), 'RGBA')
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "No valid PixelRTS metadata" in result.message

        temp_path.unlink()

    def test_corrupted_metadata_fails(self, verifier):
        """Test that corrupted metadata fails."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img = Image.fromarray(np.zeros((256, 256, 4), dtype=np.uint8), 'RGBA')
            png_info = PngImagePlugin.PngInfo()
            # Invalid PixelRTS metadata
            png_info.add_text('PixelRTS', 'PixelRTS{invalid json}')
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "No valid PixelRTS metadata" in result.message

        temp_path.unlink()

    def test_missing_file_fails(self, verifier):
        """Test that missing file fails gracefully."""
        context = VerificationContext(Path("/nonexistent/file.png"))
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "Cannot read file" in result.message

    def test_various_power_of_two_sizes(self, verifier):
        """Test that various power-of-2 sizes pass."""
        for size in [64, 128, 256, 512]:
            with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
                img = Image.fromarray(
                    np.zeros((size, size, 4), dtype=np.uint8),
                    'RGBA'
                )
                metadata = PixelRTSMetadata.create_metadata(grid_size=size)
                encoded = PixelRTSMetadata.encode_png_text(metadata)
                png_info = PngImagePlugin.PngInfo()
                png_info.add_text('PixelRTS', encoded.decode('utf-8'))
                img.save(f, format='PNG', pnginfo=png_info)
                temp_path = Path(f.name)

            context = VerificationContext(temp_path)
            result = verifier.verify(context)

            assert result.status == VerificationStatus.PASS, f"Failed for size {size}"
            assert result.details["grid_size"] == size

            temp_path.unlink()

    def test_is_power_of_two(self, verifier):
        """Test _is_power_of_two helper."""
        # Powers of 2
        assert verifier._is_power_of_two(1) is True
        assert verifier._is_power_of_two(2) is True
        assert verifier._is_power_of_two(4) is True
        assert verifier._is_power_of_two(8) is True
        assert verifier._is_power_of_two(16) is True
        assert verifier._is_power_of_two(256) is True
        assert verifier._is_power_of_two(1024) is True

        # Not powers of 2
        assert verifier._is_power_of_two(0) is False
        assert verifier._is_power_of_two(3) is False
        assert verifier._is_power_of_two(5) is False
        assert verifier._is_power_of_two(100) is False
        assert verifier._is_power_of_two(255) is False

    def test_duration_measured(self, verifier, valid_rts_png):
        """Test that verification duration is measured."""
        context = VerificationContext(valid_rts_png)
        result = verifier.verify(context)

        assert result.duration_ms >= 0

    def test_png_signature_constant(self, verifier):
        """Test PNG signature constant is correct."""
        expected = bytes([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A])
        assert verifier.PNG_SIGNATURE == expected

#!/usr/bin/env python3
"""
Tests for SegmentIntegrityChecker.

Tests per-segment integrity verification using range-based decode.
"""

import base64
import sys
import tempfile
from pathlib import Path
from unittest.mock import patch

import numpy as np
import pytest
from PIL import Image, PngImagePlugin

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata
from systems.pixel_compiler.verification.context import VerificationContext
from systems.pixel_compiler.verification.result import VerificationStatus
from systems.pixel_compiler.verification.segment_integrity_checker import SegmentIntegrityChecker


class TestSegmentIntegrityChecker:
    """Tests for SegmentIntegrityChecker class."""

    @pytest.fixture
    def verifier(self):
        """Create a SegmentIntegrityChecker instance."""
        return SegmentIntegrityChecker()

    @pytest.fixture
    def verifier_kernel_only(self):
        """Create a SegmentIntegrityChecker for kernel only."""
        return SegmentIntegrityChecker(segment_name="kernel")

    @pytest.fixture
    def rts_png_with_segments(self):
        """Create a valid .rts.png file with segment metadata for testing."""
        # Create test segment data
        kernel_data = b"Kernel binary data here - test content"
        initrd_data = b"Initrd data content - test"
        disk_data = b"Disk image data - test content here"

        # Compute hashes for each segment
        kernel_hash = PixelRTSMetadata.hash_data(kernel_data)
        initrd_hash = PixelRTSMetadata.hash_data(initrd_data)
        disk_hash = PixelRTSMetadata.hash_data(disk_data)

        # Create a combined data array (simulating how segments are stored)
        # Each segment starts at a pixel boundary (4 bytes per pixel)
        all_data = kernel_data + initrd_data + disk_data

        # Encode as base64
        all_data_b64 = base64.b64encode(all_data).decode('utf-8')

        # Calculate offsets (byte positions in decoded data)
        kernel_start = 0
        kernel_size = len(kernel_data)
        initrd_start = kernel_start + kernel_size
        initrd_size = len(initrd_data)
        disk_start = initrd_start + initrd_size
        disk_size = len(disk_data)

        # Create minimal 256x256 image
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with segment offsets and hashes
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = all_data_b64
        metadata["data_size"] = len(all_data)
        metadata["offsets"] = {
            "kernel": {"start": kernel_start, "size": kernel_size},
            "initrd": {"start": initrd_start, "size": initrd_size},
            "disk": {"start": disk_start, "size": disk_size}
        }
        metadata["hashes"] = {
            "kernel": kernel_hash,
            "initrd": initrd_hash,
            "disk": disk_hash
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path, metadata

        # Cleanup
        if temp_path.exists():
            temp_path.unlink()

    @pytest.fixture
    def rts_png_without_offsets(self):
        """Create an .rts.png file without segment offsets."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata without offsets
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["hashes"] = {"kernel": "abc123..."}

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

    @pytest.fixture
    def rts_png_without_hashes(self):
        """Create an .rts.png file without hashes."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata without hashes
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["offsets"] = {"kernel": {"start": 0, "size": 100}}

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
        assert verifier.name == "segment_integrity"
        assert "segment" in verifier.description.lower()
        assert "integrity" in verifier.description.lower()

    def test_verify_all_segments_pass(self, verifier, rts_png_with_segments):
        """Test that verifying all segments passes when hashes match."""
        temp_path, metadata = rts_png_with_segments

        # Mock decode_range to return expected segment data
        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder.decode_range') as mock_decode:
            # Setup mock to return correct data based on offset
            def mock_decode_range(png_data, start, size):
                # Reconstruct the original data
                kernel_data = b"Kernel binary data here - test content"
                initrd_data = b"Initrd data content - test"
                disk_data = b"Disk image data - test content here"
                all_data = kernel_data + initrd_data + disk_data
                return all_data[start:start + size]

            mock_decode.side_effect = mock_decode_range

            context = VerificationContext(temp_path)
            result = verifier.verify(context)

        assert result.status == VerificationStatus.PASS
        assert "segment" in result.message.lower()
        assert "verified" in result.message.lower()
        assert "segments" in result.details
        assert len(result.details["segments"]) == 3

    def test_verify_single_segment_pass(self, verifier_kernel_only, rts_png_with_segments):
        """Test that verifying a single segment passes when hash matches."""
        temp_path, metadata = rts_png_with_segments

        # Mock decode_range
        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder.decode_range') as mock_decode:
            kernel_data = b"Kernel binary data here - test content"

            def mock_decode_range(png_data, start, size):
                return kernel_data[start:start + size]

            mock_decode.side_effect = mock_decode_range

            context = VerificationContext(temp_path)
            result = verifier_kernel_only.verify(context)

        assert result.status == VerificationStatus.PASS
        assert "kernel" in result.details["segments"]

    def test_segment_hash_mismatch(self, verifier, rts_png_with_segments):
        """Test that hash mismatch is detected."""
        temp_path, metadata = rts_png_with_segments

        # Mock decode_range to return wrong data
        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder.decode_range') as mock_decode:
            mock_decode.return_value = b"WRONG DATA - THIS WILL NOT MATCH THE HASH"

            context = VerificationContext(temp_path)
            result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "failed" in result.message.lower() or "mismatch" in str(result.details).lower()
        assert "failed_segments" in result.details

    def test_missing_offsets_metadata(self, verifier, rts_png_without_offsets):
        """Test that missing offsets metadata returns SKIP."""
        context = VerificationContext(rts_png_without_offsets)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "offset" in result.message.lower()

    def test_missing_hash_in_hashes(self, verifier):
        """Test that segment without hash is handled correctly."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with offsets but no matching hash
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["offsets"] = {"kernel": {"start": 0, "size": 100}}
        metadata["hashes"] = {"other_segment": "abc123..."}  # No kernel hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        # Should skip since no segment has both offset and hash
        assert result.status == VerificationStatus.SKIP
        assert "No segments found" in result.message

        temp_path.unlink()

    def test_missing_hashes_metadata(self, verifier, rts_png_without_hashes):
        """Test that missing hashes metadata returns SKIP."""
        context = VerificationContext(rts_png_without_hashes)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "hash" in result.message.lower()

    def test_decode_range_error(self, verifier, rts_png_with_segments):
        """Test that decode_range errors are handled gracefully."""
        temp_path, metadata = rts_png_with_segments

        # Mock decode_range to raise an error
        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder.decode_range') as mock_decode:
            mock_decode.side_effect = ValueError("Invalid range")

            context = VerificationContext(temp_path)
            result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "failed" in result.message.lower()
        # The error should be captured in failed_segments
        assert len(result.details.get("failed_segments", [])) > 0

    def test_invalid_offset_format(self, verifier):
        """Test that invalid offset format is handled."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with malformed offset
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["offsets"] = {"kernel": "not a dict"}  # Invalid format
        metadata["hashes"] = {"kernel": "abc123..."}

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "failed" in result.message.lower()

        temp_path.unlink()

    def test_no_metadata_skips(self, verifier):
        """Test that file without PixelRTS metadata returns SKIP."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            # Valid PNG but no PixelRTS metadata
            img = Image.fromarray(np.zeros((256, 256, 4), dtype=np.uint8), 'RGBA')
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "No metadata found" in result.message

        temp_path.unlink()

    def test_duration_measured(self, verifier, rts_png_with_segments):
        """Test that verification duration is measured."""
        temp_path, _ = rts_png_with_segments

        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder.decode_range') as mock_decode:
            mock_decode.return_value = b"test"

            context = VerificationContext(temp_path)
            result = verifier.verify(context)

        assert result.duration_ms >= 0

    def test_segment_name_constructor(self):
        """Test that segment_name is stored in constructor."""
        v_all = SegmentIntegrityChecker()
        assert v_all.segment_name is None

        v_kernel = SegmentIntegrityChecker(segment_name="kernel")
        assert v_kernel.segment_name == "kernel"

        v_disk = SegmentIntegrityChecker(segment_name="disk")
        assert v_disk.segment_name == "disk"

    def test_sizes_in_pass_details(self, verifier, rts_png_with_segments):
        """Test that segment sizes are included in pass details."""
        temp_path, metadata = rts_png_with_segments

        with patch('systems.pixel_compiler.pixelrts_v2_core.PixelRTSDecoder.decode_range') as mock_decode:
            def mock_decode_range(png_data, start, size):
                kernel_data = b"Kernel binary data here - test content"
                initrd_data = b"Initrd data content - test"
                disk_data = b"Disk image data - test content here"
                all_data = kernel_data + initrd_data + disk_data
                return all_data[start:start + size]

            mock_decode.side_effect = mock_decode_range

            context = VerificationContext(temp_path)
            result = verifier.verify(context)

        assert result.status == VerificationStatus.PASS
        assert "sizes" in result.details
        assert "kernel" in result.details["sizes"]
        assert result.details["sizes"]["kernel"] > 0

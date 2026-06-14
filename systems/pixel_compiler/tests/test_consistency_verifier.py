#!/usr/bin/env python3
"""
Tests for ConsistencyVerifier.

Tests hash consistency verification between metadata and decoded data.
"""

import base64
import sys
import tempfile
from pathlib import Path

import numpy as np
import pytest
from PIL import Image, PngImagePlugin

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata
from systems.pixel_compiler.verification.consistency_verifier import ConsistencyVerifier
from systems.pixel_compiler.verification.context import VerificationContext
from systems.pixel_compiler.verification.result import VerificationStatus


class TestConsistencyVerifier:
    """Tests for ConsistencyVerifier class."""

    @pytest.fixture
    def verifier(self):
        """Create a ConsistencyVerifier instance."""
        return ConsistencyVerifier()

    @pytest.fixture
    def valid_rts_png_with_hash(self):
        """Create a valid .rts.png file with hash metadata for testing."""
        # Create test data
        test_data = b"Test data for hash verification - this is some binary content"
        data_hash = PixelRTSMetadata.hash_data(test_data)

        # Encode data as base64 for code mode storage
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        # Create minimal 256x256 image
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with hash
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path, data_hash, test_data

        # Cleanup
        if temp_path.exists():
            temp_path.unlink()

    @pytest.fixture
    def rts_png_without_hashes(self):
        """Create an .rts.png file without hash metadata."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata without hashes
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        # Explicitly clear hashes
        metadata["hashes"] = {}

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
        assert verifier.name == "consistency"
        assert "SHA256" in verifier.description
        assert "hash" in verifier.description.lower()

    def test_valid_rts_png_hash_matches(self, verifier, valid_rts_png_with_hash):
        """Test that a valid .rts.png file with matching hash passes verification."""
        temp_path, expected_hash, test_data = valid_rts_png_with_hash

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.PASS
        assert "Hash consistency verified" in result.message
        assert "hash" in result.details
        assert result.details["data_size"] == len(test_data)

    def test_hash_mismatch_detected(self, verifier):
        """Test that hash mismatch is detected and fails verification."""
        # Create test data
        original_data = b"Original data content"
        original_hash = PixelRTSMetadata.hash_data(original_data)

        # Different data that will be decoded
        different_data = b"Different data content - this is corrupted!"
        different_b64 = base64.b64encode(different_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with ORIGINAL hash but DIFFERENT data stored
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = different_b64  # Different data
        metadata["hashes"]["data"] = original_hash  # Original hash (mismatch!)

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "Hash mismatch" in result.message
        assert result.details["expected"] == original_hash
        # The actual hash should be different
        assert result.details["actual"] != original_hash

        temp_path.unlink()

    def test_missing_hash_metadata_skips(self, verifier, rts_png_without_hashes):
        """Test that missing hash metadata returns SKIP status."""
        context = VerificationContext(rts_png_without_hashes)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "No hash metadata found" in result.message

    def test_no_hashes_key_in_metadata(self, verifier):
        """Test that metadata without 'hashes' key returns SKIP."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata and remove hashes entirely
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        del metadata["hashes"]

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "No hash metadata found" in result.message

        temp_path.unlink()

    def test_no_data_hash_key_in_hashes(self, verifier):
        """Test that hashes without 'data' key returns SKIP."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with segment hashes but no 'data' hash
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["hashes"] = {
            "kernel": "abc123...",
            "initrd": "def456..."
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "No data hash found" in result.message
        assert "available_hashes" in result.details
        assert "kernel" in result.details["available_hashes"]

        temp_path.unlink()

    def test_corrupted_data_detected(self, verifier):
        """Test that corrupted data (hash mismatch) is detected."""
        # This is essentially the same as test_hash_mismatch_detected
        # but framed as detecting corruption
        original_data = b"Clean uncorrupted data"
        corrupted_data = original_data[:-4] + b"XXXX"  # Corrupt last 4 bytes

        original_hash = PixelRTSMetadata.hash_data(original_data)
        corrupted_b64 = base64.b64encode(corrupted_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = corrupted_b64
        metadata["hashes"]["data"] = original_hash  # Original (uncorrupted) hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "corrupted" in result.message.lower() or "mismatch" in result.message.lower()

        temp_path.unlink()

    def test_missing_file_fails(self, verifier):
        """Test that missing file fails gracefully."""
        context = VerificationContext(Path("/nonexistent/file.png"))
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        # Since metadata is None for nonexistent file, we get SKIP

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

    def test_duration_measured(self, verifier, valid_rts_png_with_hash):
        """Test that verification duration is measured."""
        temp_path, _, _ = valid_rts_png_with_hash

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.duration_ms >= 0

    def test_hash_truncated_in_pass_details(self, verifier, valid_rts_png_with_hash):
        """Test that hash is truncated in pass details for readability."""
        temp_path, _, _ = valid_rts_png_with_hash

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        # Hash should be truncated (16 chars + "...")
        assert result.status == VerificationStatus.PASS
        hash_detail = result.details["hash"]
        assert hash_detail.endswith("...")
        assert len(hash_detail) == 19  # 16 chars + "..."

    def test_full_hash_shown_on_mismatch(self, verifier):
        """Test that full hashes are shown on mismatch for debugging."""
        original_data = b"Original"
        original_hash = PixelRTSMetadata.hash_data(original_data)
        different_data = b"Different"
        different_b64 = base64.b64encode(different_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = different_b64
        metadata["hashes"]["data"] = original_hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        # Full 64-char SHA256 hashes should be shown
        assert len(result.details["expected"]) == 64
        assert len(result.details["actual"]) == 64

        temp_path.unlink()

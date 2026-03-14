#!/usr/bin/env python3
"""
Tests for SignatureVerifier.

Tests Ed25519 signature verification for PixelRTS files.
"""

import base64
import os
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
from systems.pixel_compiler.verification.signature_verifier import SignatureVerifier


class TestSignatureVerifier:
    """Tests for SignatureVerifier class."""

    @pytest.fixture
    def verifier(self):
        """Create a SignatureVerifier instance."""
        return SignatureVerifier()

    @pytest.fixture
    def ed25519_key_pair(self):
        """Generate an Ed25519 key pair for testing."""
        from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey

        private_key = Ed25519PrivateKey.generate()
        public_key = private_key.public_key()

        return {
            "private_key": private_key,
            "public_key": public_key,
            "public_key_hex": public_key.public_bytes_raw().hex()
        }

    @pytest.fixture
    def signed_rts_png(self, ed25519_key_pair):
        """Create a valid signed .rts.png file for testing."""
        # Create test data
        test_data = b"Test data for signature verification - signed content"
        data_hash = PixelRTSMetadata.hash_data(test_data)

        # Sign the data hash (not the full data)
        signature = ed25519_key_pair["private_key"].sign(bytes.fromhex(data_hash))
        signature_hex = signature.hex()
        public_key_hex = ed25519_key_pair["public_key_hex"]

        # Encode data as base64 for code mode storage
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        # Create minimal 256x256 image
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with signature
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["signature"] = {
            "value": signature_hex,
            "public_key": public_key_hex,
            "algorithm": "Ed25519"
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path, public_key_hex, signature_hex, data_hash

        # Cleanup
        if temp_path.exists():
            temp_path.unlink()

    @pytest.fixture
    def unsigned_rts_png(self, ed25519_key_pair):
        """Create an unsigned .rts.png file for testing.

        Has public key but no signature value - simulates a file that
        could be signed but isn't.
        """
        test_data = b"Test data without signature"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with public key but NO signature value
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        # Include public key so we can test "not signed" vs "no public key"
        metadata["signature"] = {
            "public_key": ed25519_key_pair["public_key_hex"],
            # No "value" key - file is not signed
        }

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
    def rts_png_no_data_hash(self, ed25519_key_pair):
        """Create a signed .rts.png file without data hash."""
        test_data = b"Test data"
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        # Sign some dummy data
        signature = ed25519_key_pair["private_key"].sign(b"dummy hash 32 bytes for testing!!")
        signature_hex = signature.hex()
        public_key_hex = ed25519_key_pair["public_key_hex"]

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with signature but NO data hash
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"] = {}  # No data hash
        metadata["signature"] = {
            "value": signature_hex,
            "public_key": public_key_hex
        }

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
        assert verifier.name == "signature"
        assert "Ed25519" in verifier.description
        assert "signature" in verifier.description.lower()

    def test_pass_valid_signature(self, verifier, signed_rts_png):
        """Test that a valid signature passes verification."""
        temp_path, public_key_hex, _, _ = signed_rts_png

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.PASS
        assert "verification passed" in result.message.lower()
        assert "public_key" in result.details

    def test_fail_invalid_signature(self, verifier, ed25519_key_pair):
        """Test that an invalid signature fails verification."""
        # Create test data
        test_data = b"Test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        # Create a DIFFERENT key pair and sign with that (wrong key)
        from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
        wrong_key = Ed25519PrivateKey.generate()
        wrong_signature = wrong_key.sign(bytes.fromhex(data_hash))

        # Use the original public key (mismatch!)
        public_key_hex = ed25519_key_pair["public_key_hex"]

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["signature"] = {
            "value": wrong_signature.hex(),
            "public_key": public_key_hex
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "tampered" in result.message.lower() or "invalid" in result.message.lower()

        temp_path.unlink()

    def test_skip_no_signature(self, verifier, unsigned_rts_png):
        """Test that unsigned file returns SKIP."""
        context = VerificationContext(unsigned_rts_png)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.SKIP
        assert "not signed" in result.message.lower()

    def test_skip_no_public_key(self, verifier):
        """Test that missing public key returns SKIP."""
        test_data = b"Test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with signature but NO public key
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["signature"] = {
            "value": "some_signature_hex",
            # No public_key!
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
        assert "no public key" in result.message.lower()

        temp_path.unlink()

    def test_pass_env_var_override(self, verifier, signed_rts_png):
        """Test that PIXELRTS_PUBLIC_KEY env var overrides embedded key."""
        temp_path, public_key_hex, _, _ = signed_rts_png

        # Set env var to the same key (should still pass)
        with patch.dict(os.environ, {"PIXELRTS_PUBLIC_KEY": public_key_hex}):
            context = VerificationContext(temp_path)
            result = verifier.verify(context)

            assert result.status == VerificationStatus.PASS

    def test_fail_env_var_wrong_key(self, verifier, signed_rts_png, ed25519_key_pair):
        """Test that wrong env var key fails verification."""
        temp_path, _, _, _ = signed_rts_png

        # Generate a different key and set as env var
        from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
        wrong_key = Ed25519PrivateKey.generate()
        wrong_public_hex = wrong_key.public_key().public_bytes_raw().hex()

        with patch.dict(os.environ, {"PIXELRTS_PUBLIC_KEY": wrong_public_hex}):
            context = VerificationContext(temp_path)
            result = verifier.verify(context)

            assert result.status == VerificationStatus.FAIL

    def test_fail_tampered_data(self, verifier, ed25519_key_pair):
        """Test that tampered data (wrong hash) fails verification."""
        # Original data and signature
        original_data = b"Original data content"
        original_hash = PixelRTSMetadata.hash_data(original_data)
        signature = ed25519_key_pair["private_key"].sign(bytes.fromhex(original_hash))

        # Tampered data (different)
        tampered_data = b"Tampered data content!!"
        tampered_hash = PixelRTSMetadata.hash_data(tampered_data)
        tampered_b64 = base64.b64encode(tampered_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata with ORIGINAL signature but TAMPERED hash
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = tampered_b64
        metadata["hashes"]["data"] = tampered_hash  # Tampered hash
        metadata["signature"] = {
            "value": signature.hex(),  # Original signature (won't match tampered hash)
            "public_key": ed25519_key_pair["public_key_hex"]
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "tampered" in result.message.lower() or "invalid" in result.message.lower()

        temp_path.unlink()

    def test_skip_no_metadata(self, verifier):
        """Test that file without metadata returns SKIP."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            # Valid PNG but no PixelRTS metadata
            img = Image.fromarray(np.zeros((256, 256, 4), dtype=np.uint8), 'RGBA')
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        # Without metadata, we can't get a public key, so SKIP
        assert result.status == VerificationStatus.SKIP

        temp_path.unlink()

    def test_skip_no_data_hash(self, verifier, rts_png_no_data_hash):
        """Test that missing data hash returns FAIL."""
        context = VerificationContext(rts_png_no_data_hash)
        result = verifier.verify(context)

        # No data hash means we can't verify - should be FAIL
        assert result.status == VerificationStatus.FAIL
        assert "hash" in result.message.lower()

    def test_fail_malformed_public_key(self, verifier):
        """Test that malformed public key fails verification."""
        test_data = b"Test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["signature"] = {
            "value": "a" * 128,  # Valid-looking signature
            "public_key": "not_valid_hex!"  # Invalid hex
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "malformed" in result.message.lower()

        temp_path.unlink()

    def test_fail_malformed_signature(self, verifier, ed25519_key_pair):
        """Test that malformed signature fails verification."""
        test_data = b"Test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["signature"] = {
            "value": "not_valid_hex!",  # Invalid hex
            "public_key": ed25519_key_pair["public_key_hex"]
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.FAIL
        assert "malformed" in result.message.lower()

        temp_path.unlink()

    def test_duration_measured(self, verifier, signed_rts_png):
        """Test that verification duration is measured."""
        temp_path, _, _, _ = signed_rts_png

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.duration_ms >= 0

    def test_public_key_truncated_in_details(self, verifier, signed_rts_png):
        """Test that public key is truncated in pass details for readability."""
        temp_path, public_key_hex, _, _ = signed_rts_png

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        assert result.status == VerificationStatus.PASS
        key_detail = result.details["public_key"]
        assert key_detail.endswith("...")
        assert len(key_detail) == 19  # 16 chars + "..."

    def test_signature_verifies_hash_not_data(self, verifier, ed25519_key_pair):
        """Test that signature verifies the hash, not the full data."""
        # This test ensures we're signing the 32-byte hash, not the full data
        test_data = b"Test data for hash signing verification"
        data_hash = PixelRTSMetadata.hash_data(test_data)

        # Sign the HASH (32 bytes), which is what the verifier expects
        signature = ed25519_key_pair["private_key"].sign(bytes.fromhex(data_hash))

        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["signature"] = {
            "value": signature.hex(),
            "public_key": ed25519_key_pair["public_key_hex"]
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        context = VerificationContext(temp_path)
        result = verifier.verify(context)

        # Should pass because we signed the hash
        assert result.status == VerificationStatus.PASS

        temp_path.unlink()

    def test_env_var_takes_precedence(self, verifier, signed_rts_png, ed25519_key_pair):
        """Test that env var takes precedence over embedded key."""
        temp_path, _, _, _ = signed_rts_png

        # Use the correct key via env var (file has embedded key too)
        # This proves env var is used by using a different key and expecting failure
        from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
        different_key = Ed25519PrivateKey.generate()
        different_public_hex = different_key.public_key().public_bytes_raw().hex()

        with patch.dict(os.environ, {"PIXELRTS_PUBLIC_KEY": different_public_hex}):
            context = VerificationContext(temp_path)
            result = verifier.verify(context)

            # Should FAIL because env var key is different from signing key
            assert result.status == VerificationStatus.FAIL

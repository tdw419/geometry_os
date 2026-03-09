#!/usr/bin/env python3
"""
Tests for FileSigner.

Tests Ed25519 signing and verification of PixelRTS files.
"""

import sys
import tempfile
import base64
from io import BytesIO
from pathlib import Path
from unittest.mock import patch, MagicMock

import numpy as np
from PIL import Image
from PIL import PngImagePlugin
import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.verification.file_signer import FileSigner
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata, PixelRTSEncoder
from cryptography.hazmat.primitives.asymmetric import ed25519


class TestFileSigner:
    """Tests for FileSigner class."""

    @pytest.fixture
    def private_key(self):
        """Create a test private key."""
        return ed25519.Ed25519PrivateKey.generate()

    @pytest.fixture
    def signer(self, private_key):
        """Create a FileSigner instance."""
        return FileSigner(private_key)

    def _create_test_pixelrts(self, data: bytes = None) -> Path:
        """
        Helper: Create a test PixelRTS file with hash metadata.

        Args:
            data: Optional test data (default: random bytes)

        Returns:
            Path to the created test file
        """
        if data is None:
            data = b"Test PixelRTS data for signing verification"

        # Calculate hash
        data_hash = PixelRTSMetadata.hash_data(data)

        # Encode data as base64 for code mode storage
        data_b64 = base64.b64encode(data).decode('utf-8')

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

        return temp_path

    def _create_test_pixelrts_without_hash(self) -> Path:
        """Helper: Create a PixelRTS file without hash metadata."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        # Create metadata without hashes
        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["hashes"] = {}

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        return temp_path

    def _create_non_pixelrts_png(self) -> Path:
        """Helper: Create a regular PNG file (not PixelRTS)."""
        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f, format='PNG')
            temp_path = Path(f.name)

        return temp_path

    # ==================== Tests ====================

    def test_generate_keypair(self):
        """Test that generate_keypair creates valid Ed25519 keypair."""
        private_key, public_key_bytes = FileSigner.generate_keypair()

        # Check types
        assert isinstance(private_key, ed25519.Ed25519PrivateKey)
        assert isinstance(public_key_bytes, bytes)

        # Ed25519 public keys are 32 bytes
        assert len(public_key_bytes) == 32

    def test_save_and_load_private_key(self, private_key, tmp_path):
        """Test saving and loading private key in PEM format."""
        key_path = tmp_path / "test_key.pem"

        # Save key
        FileSigner.save_private_key(private_key, key_path)

        # Check file exists
        assert key_path.exists()

        # Check it's PEM format
        content = key_path.read_text()
        assert "-----BEGIN PRIVATE KEY-----" in content
        assert "-----END PRIVATE KEY-----" in content

        # Load key
        loaded_key = FileSigner.load_private_key(key_path)

        # Check it's the same key (can sign/verify)
        assert isinstance(loaded_key, ed25519.Ed25519PrivateKey)

        # Verify keys are equivalent by signing and verifying
        test_message = b"test message"
        signature = loaded_key.sign(test_message)
        public_key = private_key.public_key()
        public_key.verify(signature, test_message)  # Should not raise

    def test_sign_file_creates_signature(self, signer):
        """Test that sign_file adds signature metadata."""
        # Create test file
        test_file = self._create_test_pixelrts()

        try:
            # Sign the file
            signed_path = signer.sign_file(test_file)

            # Check file exists
            assert signed_path.exists()

            # Read back and check signature exists
            img = Image.open(signed_path)
            metadata_text = img.text.get("PixelRTS")
            assert metadata_text is not None

            metadata = PixelRTSMetadata.decode_png_text(
                metadata_text.encode("utf-8")
            )

            # Check signature structure
            assert "signature" in metadata
            signature = metadata["signature"]
            assert signature["algorithm"] == "Ed25519"
            assert "public_key" in signature
            assert "value" in signature

            # Signature should be 64 bytes as hex (128 chars)
            assert len(signature["value"]) == 128

            # Public key should be 32 bytes as hex (64 chars)
            assert len(signature["public_key"]) == 64

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_sign_file_includes_public_key(self, signer):
        """Test that signed file includes public key for verification."""
        test_file = self._create_test_pixelrts()

        try:
            signed_path = signer.sign_file(test_file)

            # Read signature
            img = Image.open(signed_path)
            metadata = PixelRTSMetadata.decode_png_text(
                img.text["PixelRTS"].encode("utf-8")
            )

            # Check public key is present and valid
            public_key_hex = metadata["signature"]["public_key"]
            public_key_bytes = bytes.fromhex(public_key_hex)

            # Should be able to reconstruct public key
            loaded_public_key = FileSigner.load_public_key(public_key_bytes)
            assert isinstance(loaded_public_key, ed25519.Ed25519PublicKey)

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_sign_file_invalid_input(self, signer):
        """Test that sign_file raises ValueError for non-PixelRTS files."""
        # Non-PixelRTS PNG
        non_rts_file = self._create_non_pixelrts_png()

        try:
            with pytest.raises(ValueError, match="Not a PixelRTS file"):
                signer.sign_file(non_rts_file)
        finally:
            non_rts_file.unlink()

        # Non-existent file
        with pytest.raises(FileNotFoundError):
            signer.sign_file(Path("/nonexistent/file.png"))

    def test_sign_file_missing_hash(self, signer):
        """Test that sign_file raises ValueError for files without hash."""
        test_file = self._create_test_pixelrts_without_hash()

        try:
            with pytest.raises(ValueError, match="missing data hash"):
                signer.sign_file(test_file)
        finally:
            if test_file.exists():
                test_file.unlink()

    def test_signed_file_verifiable(self, signer):
        """Test that signed file can be verified with included public key."""
        test_file = self._create_test_pixelrts()

        try:
            signed_path = signer.sign_file(test_file)

            # Read the signed file
            img = Image.open(signed_path)
            metadata = PixelRTSMetadata.decode_png_text(
                img.text["PixelRTS"].encode("utf-8")
            )

            # Extract signature info
            signature_hex = metadata["signature"]["value"]
            public_key_hex = metadata["signature"]["public_key"]
            data_hash = metadata["hashes"]["data"]

            # Verify signature
            signature = bytes.fromhex(signature_hex)
            public_key_bytes = bytes.fromhex(public_key_hex)
            hash_bytes = bytes.fromhex(data_hash)

            public_key = FileSigner.load_public_key(public_key_bytes)

            # This should not raise
            public_key.verify(signature, hash_bytes)

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_sign_file_overwrite(self, signer):
        """Test that sign_file can overwrite the original file."""
        test_file = self._create_test_pixelrts()

        try:
            # Sign without output_path (should overwrite)
            original_stat = test_file.stat()
            signed_path = signer.sign_file(test_file)

            # Should return the same path
            assert signed_path == test_file

            # File should be modified (different size or mtime)
            # Note: Size might be larger due to signature metadata
            new_stat = signed_path.stat()
            # Just check it exists and was modified
            assert signed_path.exists()

            # Verify it has signature
            img = Image.open(signed_path)
            metadata = PixelRTSMetadata.decode_png_text(
                img.text["PixelRTS"].encode("utf-8")
            )
            assert "signature" in metadata

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_sign_file_custom_output_path(self, signer):
        """Test that sign_file can write to a custom output path."""
        test_file = self._create_test_pixelrts()

        try:
            output_path = test_file.parent / "signed_output.rts.png"

            signed_path = signer.sign_file(test_file, output_path)

            # Should return the output path
            assert signed_path == output_path

            # Original should be unchanged (no signature)
            original_img = Image.open(test_file)
            original_metadata = PixelRTSMetadata.decode_png_text(
                original_img.text["PixelRTS"].encode("utf-8")
            )
            assert "signature" not in original_metadata

            # New file should have signature
            signed_img = Image.open(signed_path)
            signed_metadata = PixelRTSMetadata.decode_png_text(
                signed_img.text["PixelRTS"].encode("utf-8")
            )
            assert "signature" in signed_metadata

            # Cleanup output
            if output_path.exists():
                output_path.unlink()

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_sign_file_preserves_other_metadata(self, signer):
        """Test that signing preserves other metadata chunks."""
        test_file = self._create_test_pixelrts()

        try:
            # First, add a custom metadata chunk
            img = Image.open(test_file)
            metadata = PixelRTSMetadata.decode_png_text(
                img.text["PixelRTS"].encode("utf-8")
            )
            metadata["custom_field"] = "test_value"

            # Re-save with custom metadata
            encoded = PixelRTSMetadata.encode_png_text(metadata)
            pnginfo = PngImagePlugin.PngInfo()
            pnginfo.add_text("PixelRTS", encoded.decode("utf-8"))
            pnginfo.add_text("Custom", "custom_value")

            buffer = BytesIO()
            img.save(buffer, format="PNG", pnginfo=pnginfo)
            test_file.write_bytes(buffer.getvalue())

            # Now sign
            signed_path = signer.sign_file(test_file)

            # Check custom text chunk preserved
            signed_img = Image.open(signed_path)
            assert "Custom" in signed_img.text
            assert signed_img.text["Custom"] == "custom_value"

            # Check custom field in metadata preserved
            signed_metadata = PixelRTSMetadata.decode_png_text(
                signed_img.text["PixelRTS"].encode("utf-8")
            )
            assert signed_metadata["custom_field"] == "test_value"

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_signature_uniqueness(self):
        """Test that different keys produce different signatures."""
        # Create two different signers
        key1 = ed25519.Ed25519PrivateKey.generate()
        key2 = ed25519.Ed25519PrivateKey.generate()

        signer1 = FileSigner(key1)
        signer2 = FileSigner(key2)

        # Create test file
        test_file = self._create_test_pixelrts(b"same data for both")

        try:
            # Sign with both keys
            output1 = test_file.parent / "signed1.rts.png"
            output2 = test_file.parent / "signed2.rts.png"

            signer1.sign_file(test_file, output1)
            signer2.sign_file(test_file, output2)

            # Read signatures
            img1 = Image.open(output1)
            img2 = Image.open(output2)

            sig1 = PixelRTSMetadata.decode_png_text(
                img1.text["PixelRTS"].encode("utf-8")
            )["signature"]
            sig2 = PixelRTSMetadata.decode_png_text(
                img2.text["PixelRTS"].encode("utf-8")
            )["signature"]

            # Signatures should be different
            assert sig1["value"] != sig2["value"]
            # Public keys should be different
            assert sig1["public_key"] != sig2["public_key"]

            # Cleanup
            if output1.exists():
                output1.unlink()
            if output2.exists():
                output2.unlink()

        finally:
            if test_file.exists():
                test_file.unlink()

    def test_load_public_key(self, signer):
        """Test loading public key from bytes."""
        public_key = signer.public_key

        # Serialize
        from cryptography.hazmat.primitives import serialization
        public_key_bytes = public_key.public_bytes(
            encoding=serialization.Encoding.Raw,
            format=serialization.PublicFormat.Raw
        )

        # Load back
        loaded = FileSigner.load_public_key(public_key_bytes)

        assert isinstance(loaded, ed25519.Ed25519PublicKey)


class TestFileSignerIntegration:
    """Integration tests for FileSigner with real files."""

    def test_full_signing_workflow(self, tmp_path):
        """Test complete workflow: generate key, sign file, verify."""
        # 1. Generate keypair
        private_key, public_key_bytes = FileSigner.generate_keypair()

        # 2. Save private key
        key_path = tmp_path / "signing_key.pem"
        FileSigner.save_private_key(private_key, key_path)

        # 3. Create test PixelRTS file
        test_data = b"Integration test data for full signing workflow"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)
        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        rts_path = tmp_path / "test.rts.png"
        img.save(rts_path, format='PNG', pnginfo=png_info)

        # 4. Load private key and sign
        loaded_key = FileSigner.load_private_key(key_path)
        signer = FileSigner(loaded_key)

        signed_path = signer.sign_file(rts_path)

        # 5. Verify signature manually
        signed_img = Image.open(signed_path)
        signed_metadata = PixelRTSMetadata.decode_png_text(
            signed_img.text["PixelRTS"].encode("utf-8")
        )

        sig_info = signed_metadata["signature"]
        assert sig_info["algorithm"] == "Ed25519"

        # Verify with public key
        signature = bytes.fromhex(sig_info["value"])
        file_public_key_bytes = bytes.fromhex(sig_info["public_key"])
        hash_bytes = bytes.fromhex(data_hash)

        public_key = FileSigner.load_public_key(file_public_key_bytes)
        public_key.verify(signature, hash_bytes)  # Should not raise

        # 6. Verify public key matches what we generated
        assert file_public_key_bytes == public_key_bytes

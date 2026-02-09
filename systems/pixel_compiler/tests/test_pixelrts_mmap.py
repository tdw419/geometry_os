"""
Test suite for memory-mapped PixelRTS encoder/decoder.

Tests large file support using memory mapping to avoid loading entire file into memory.
"""

import unittest
import tempfile
from pathlib import Path
import sys

# Add parent directory to path to import modules
sys.path.insert(0, str(Path(__file__).parent.parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from pixel_compiler.pixelrts_mmap import MMapPixelRTSEncoder, MMapPixelRTSDecoder


class TestMMapEncoderDecoder(unittest.TestCase):
    """Test cases for memory-mapped encoder/decoder."""

    def test_mmap_encoder_small_file(self):
        """Test encoding a small file using memory mapping."""
        # Create a small test file (1MB)
        with tempfile.NamedTemporaryFile(delete=False, suffix='.bin') as f:
            test_file = Path(f.name)
            # Write 1MB of patterned data
            chunk = bytes(range(256)) * (1024 * 1024 // 256)  # 1MB chunk
            f.write(chunk)

        try:
            encoder = MMapPixelRTSEncoder()
            output_file = Path(tempfile.mktemp(suffix='.rts.png'))

            # Encode using mmap
            metadata = encoder.encode_file(
                input_path=str(test_file),
                output_path=str(output_file)
            )

            # Verify output exists and is valid
            self.assertTrue(output_file.exists())
            self.assertGreater(output_file.stat().st_size, 0)
            self.assertEqual(metadata['data_size'], 1024 * 1024)

            # Verify we can decode it
            decoder = MMapPixelRTSDecoder()
            recovered_file = Path(tempfile.mktemp(suffix='.bin'))

            decoder.decode_file(
                input_path=str(output_file),
                output_path=str(recovered_file)
            )

            # Verify file size matches
            self.assertEqual(recovered_file.stat().st_size, test_file.stat().st_size)

            # Verify content matches
            with open(test_file, 'rb') as f1, open(recovered_file, 'rb') as f2:
                original_data = f1.read()
                recovered_data = f2.read()
                self.assertEqual(original_data, recovered_data)

        finally:
            # Cleanup
            test_file.unlink(missing_ok=True)
            output_file.unlink(missing_ok=True)
            recovered_file.unlink(missing_ok=True)
            # Cleanup sidecar
            sidecar = Path(str(output_file) + '.meta.json')
            sidecar.unlink(missing_ok=True)

    def test_mmap_decoder_handles_metadata(self):
        """Test that mmap decoder properly handles metadata."""
        # Create test file
        with tempfile.NamedTemporaryFile(delete=False, suffix='.bin') as f:
            test_file = Path(f.name)
            f.write(b'\x00\x01\x02\x03' * 1024)

        try:
            encoder = MMapPixelRTSEncoder()
            output_file = Path(tempfile.mktemp(suffix='.rts.png'))

            metadata = {
                'type': 'kernel',
                'name': 'test_kernel',
                'version': '1.0'
            }

            encoder.encode_file(
                input_path=str(test_file),
                output_path=str(output_file),
                metadata=metadata
            )

            # Decode and verify metadata is preserved
            decoder = MMapPixelRTSDecoder()
            info = decoder.get_info(str(output_file))

            self.assertEqual(info['type'], 'kernel')
            self.assertEqual(info['name'], 'test_kernel')
            # version is stored as content_version to avoid conflict with format version
            self.assertEqual(info['content_version'], '1.0')

        finally:
            test_file.unlink(missing_ok=True)
            output_file.unlink(missing_ok=True)
            sidecar = Path(str(output_file) + '.meta.json')
            sidecar.unlink(missing_ok=True)

    def test_mmap_encoder_custom_chunk_size(self):
        """Test encoder with custom chunk size."""
        with tempfile.NamedTemporaryFile(delete=False, suffix='.bin') as f:
            test_file = Path(f.name)
            f.write(b'\x00\x01\x02\x03' * 1024)

        try:
            # Test with custom chunk size
            encoder = MMapPixelRTSEncoder(chunk_size=1024)  # 1KB chunks
            output_file = Path(tempfile.mktemp(suffix='.rts.png'))

            encoder.encode_file(
                input_path=str(test_file),
                output_path=str(output_file)
            )

            self.assertTrue(output_file.exists())

        finally:
            test_file.unlink(missing_ok=True)
            output_file.unlink(missing_ok=True)
            sidecar = Path(str(output_file) + '.meta.json')
            sidecar.unlink(missing_ok=True)

    def test_mmap_decoder_with_hash_verification(self):
        """Test decoder with hash verification."""
        # Create test file
        with tempfile.NamedTemporaryFile(delete=False, suffix='.bin') as f:
            test_file = Path(f.name)
            test_data = b'\x00\x01\x02\x03' * 1024
            f.write(test_data)

        try:
            encoder = MMapPixelRTSEncoder()
            output_file = Path(tempfile.mktemp(suffix='.rts.png'))

            encoder.encode_file(
                input_path=str(test_file),
                output_path=str(output_file)
            )

            # Decode with hash verification
            decoder = MMapPixelRTSDecoder()
            recovered_file = Path(tempfile.mktemp(suffix='.bin'))

            decoder.decode_file(
                input_path=str(output_file),
                output_path=str(recovered_file),
                verify_hash=True
            )

            # Verify content
            with open(recovered_file, 'rb') as f:
                recovered_data = f.read()
            self.assertEqual(test_data, recovered_data)

        finally:
            test_file.unlink(missing_ok=True)
            output_file.unlink(missing_ok=True)
            recovered_file.unlink(missing_ok=True)
            sidecar = Path(str(output_file) + '.meta.json')
            sidecar.unlink(missing_ok=True)

    def test_mmap_encoder_code_mode(self):
        """Test encoder in code mode."""
        with tempfile.NamedTemporaryFile(delete=False, suffix='.bin') as f:
            test_file = Path(f.name)
            # Write WASM-like data
            f.write(b'\x00asm\x01\x00\x00\x00' + b'\x00' * 1024)

        try:
            encoder = MMapPixelRTSEncoder(mode="code")
            output_file = Path(tempfile.mktemp(suffix='.rts.png'))

            metadata = encoder.encode_file(
                input_path=str(test_file),
                output_path=str(output_file)
            )

            # Verify encoding mode is set
            self.assertIn('encoding_mode', metadata)
            self.assertTrue(metadata['encoding_mode'].startswith('RGBA'))

        finally:
            test_file.unlink(missing_ok=True)
            output_file.unlink(missing_ok=True)
            sidecar = Path(str(output_file) + '.meta.json')
            sidecar.unlink(missing_ok=True)

    def test_mmap_get_info_from_png(self):
        """Test get_info extracts metadata from PNG."""
        with tempfile.NamedTemporaryFile(delete=False, suffix='.bin') as f:
            test_file = Path(f.name)
            f.write(b'\x00\x01\x02\x03' * 1024)

        try:
            encoder = MMapPixelRTSEncoder()
            output_file = Path(tempfile.mktemp(suffix='.rts.png'))

            metadata = {
                'type': 'test',
                'name': 'test_file',
                'description': 'Test description'
            }

            encoder.encode_file(
                input_path=str(test_file),
                output_path=str(output_file),
                metadata=metadata
            )

            # Get info without sidecar (from PNG tEXt)
            decoder = MMapPixelRTSDecoder()
            info = decoder.get_info(str(output_file))

            self.assertEqual(info['type'], 'test')
            self.assertEqual(info['name'], 'test_file')

        finally:
            test_file.unlink(missing_ok=True)
            output_file.unlink(missing_ok=True)
            sidecar = Path(str(output_file) + '.meta.json')
            sidecar.unlink(missing_ok=True)


if __name__ == '__main__':
    unittest.main(verbosity=2)

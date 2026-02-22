"""
Test suite for WASM Extractor.

Tests extraction of WebAssembly binaries from .rts.png files.
"""

import pytest
import tempfile
import json
import math
from pathlib import Path
from PIL import Image
import numpy as np

from systems.pixel_compiler.wasm_extractor import WASMExtractor, WASMExtractionError


@pytest.fixture
def create_test_rts_png():
    """Helper fixture to create test .rts.png file."""
    def _create(path: Path, data: bytes, grid_size: int = None):
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

        encoder = PixelRTSEncoder(mode="standard")

        # Calculate grid size if not specified
        if grid_size is None:
            # Minimum grid that fits the data
            pixels_needed = (len(data) + 3) // 4
            side = math.ceil(math.sqrt(pixels_needed))
            grid_size = 2 ** math.ceil(math.log2(side))

        encoder.save(
            data=data,
            output_path=str(path),
            metadata={"type": "wasm"},
            grid_size=grid_size,
            sidecar=True
        )
    return _create


class TestWASMValidator:
    """Test WASM magic number validation."""

    def test_validate_valid_wasm(self):
        """Test validation of valid WASM binary."""
        # WASM magic number: 0x00 0x61 0x73 0x6d
        valid_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'
        assert WASMExtractor.validate_wasm(valid_wasm) is True

    def test_validate_invalid_wasm(self):
        """Test validation of invalid WASM binary."""
        invalid_wasm = b'\x00\x00\x00\x00\x01\x00\x00\x00'
        assert WASMExtractor.validate_wasm(invalid_wasm) is False

    def test_validate_empty_bytes(self):
        """Test validation of empty bytes."""
        assert WASMExtractor.validate_wasm(b'') is False

    def test_validate_short_bytes(self):
        """Test validation of bytes shorter than magic number."""
        assert WASMExtractor.validate_wasm(b'\x00\x61') is False


class TestWASMExtraction:
    """Test WASM extraction from PNG files."""

    def test_extract_from_png_valid(self, create_test_rts_png):
        """Test extraction of valid WASM from .rts.png file."""
        # Create test PNG with embedded WASM
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"
            minimal_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'

            # Create PNG with minimal WASM embedded using Hilbert curve
            create_test_rts_png(png_path, minimal_wasm)

            # Extract WASM (use expected_size to trim padding)
            extracted = WASMExtractor.extract_from_png(png_path, expected_size=len(minimal_wasm))

            # Verify extraction
            assert extracted == minimal_wasm
            assert WASMExtractor.validate_wasm(extracted) is True

    def test_extract_from_png_with_metadata(self, create_test_rts_png):
        """Test extraction using metadata for data size."""
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"
            meta_path = Path(tmpdir) / "test.rts.meta.json"

            # Create WASM with specific content
            test_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00\x01\x05\x01\x60\x00\x00'
            create_test_rts_png(png_path, test_wasm)

            # Create metadata
            metadata = {
                "format": "PixelRTS-2.0",
                "grid_size": 2,
                "data_size": len(test_wasm),
                "data_hash": "test123"
            }
            with open(meta_path, 'w') as f:
                json.dump(metadata, f)

            # Extract using metadata
            extracted = WASMExtractor.extract_from_png(png_path)

            assert len(extracted) == len(test_wasm)
            assert WASMExtractor.validate_wasm(extracted) is True

    def test_extract_from_png_invalid_wasm(self, create_test_rts_png):
        """Test extraction of invalid data (not WASM)."""
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "invalid.rts.png"

            # Create PNG with non-WASM data
            fake_data = b'\xff\xff\xff\xff'
            create_test_rts_png(png_path, fake_data)

            # Extract should still work, but validation should fail
            extracted = WASMExtractor.extract_from_png(png_path)
            assert extracted == fake_data
            assert WASMExtractor.validate_wasm(extracted) is False

    def test_extract_from_png_file_not_found(self):
        """Test extraction from non-existent file."""
        with pytest.raises(FileNotFoundError):
            WASMExtractor.extract_from_png("/nonexistent/path.rts.png")

    def test_extract_from_png_invalid_image(self):
        """Test extraction from invalid PNG file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "invalid.png"
            with open(png_path, 'wb') as f:
                f.write(b'not a png')

            with pytest.raises(WASMExtractionError):
                WASMExtractor.extract_from_png(png_path)


class TestTiledExtraction:
    """Test WASM extraction from tiled format."""

    def test_extract_from_tiled(self, create_test_rts_png):
        """Test extraction from tiled PNG format."""
        with tempfile.TemporaryDirectory() as tmpdir:
            index_path = Path(tmpdir) / "tiled_index.json"
            tile_dir = Path(tmpdir) / "tiles"
            tile_dir.mkdir()

            # Create tiled index
            test_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'

            # Split WASM into tiles
            tile_size = 4
            for i, chunk in enumerate([test_wasm[i:i+tile_size] for i in range(0, len(test_wasm), tile_size)]):
                tile_path = tile_dir / f"tile_{i}.png"
                create_test_rts_png(tile_path, chunk)

            # Create index
            index = {
                "format": "tiled",
                "tile_size": tile_size,
                "total_size": len(test_wasm),
                "tiles": [f"tile_{i}.png" for i in range((len(test_wasm) + tile_size - 1) // tile_size)]
            }
            with open(index_path, 'w') as f:
                json.dump(index, f)

            # Extract from tiled format (pass tile_dir explicitly)
            extracted = WASMExtractor.extract_from_tiled(index_path, tile_dir=tile_dir)

            assert extracted == test_wasm
            assert WASMExtractor.validate_wasm(extracted) is True


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_large_wasm(self, create_test_rts_png):
        """Test extraction of larger WASM binary."""
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "large.rts.png"

            # Create larger WASM-like binary (1KB)
            large_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00' + b'\x00' * 1016
            create_test_rts_png(png_path, large_wasm)

            extracted = WASMExtractor.extract_from_png(png_path, expected_size=len(large_wasm))
            assert len(extracted) == len(large_wasm)
            assert WASMExtractor.validate_wasm(extracted) is True

    def test_extract_with_trailing_zeros(self, create_test_rts_png):
        """Test extraction when PNG has trailing zero pixels."""
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"

            # Small WASM
            small_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'
            create_test_rts_png(png_path, small_wasm, grid_size=4)

            # Metadata should tell us exact size
            meta_path = Path(tmpdir) / "test.rts.meta.json"
            metadata = {
                "format": "PixelRTS-2.0",
                "grid_size": 4,
                "data_size": len(small_wasm)
            }
            with open(meta_path, 'w') as f:
                json.dump(metadata, f)

            extracted = WASMExtractor.extract_from_png(png_path)
            assert extracted == small_wasm


class TestRealWorldExamples:
    """Tests with realistic WASM binaries."""

    def test_simple_add_function(self, create_test_rts_png):
        """Test extraction of simple add function WASM."""
        # Minimal WASM with add function
        add_wasm = bytes([
            0x00, 0x61, 0x73, 0x6d,  # magic
            0x01, 0x00, 0x00, 0x00,  # version
            0x01, 0x07, 0x01,        # type section
            0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f,  # func type: (i32, i32) -> i32
            0x03, 0x02, 0x01, 0x00,  # function section
            0x07, 0x07, 0x01, 0x03, 0x61, 0x64, 0x64, 0x00, 0x00,  # export "add"
            0x0a, 0x09, 0x01, 0x07, 0x00,  # code section
            0x20, 0x00, 0x20, 0x01, 0x6a, 0x0b  # local.get 0, local.get 1, i32.add, end
        ])

        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "add.rts.png"
            create_test_rts_png(png_path, add_wasm)

            extracted = WASMExtractor.extract_from_png(png_path, expected_size=len(add_wasm))
            assert extracted == add_wasm
            assert WASMExtractor.validate_wasm(extracted) is True

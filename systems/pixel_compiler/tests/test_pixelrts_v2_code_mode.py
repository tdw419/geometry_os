#!/usr/bin/env python3
"""
Unit tests for PixelRTS v2 code-mode encoding/decoding.

Tests code-mode cartridges which use RGBA-semantic encoding for visualization
while preserving original data in metadata for decoding.
"""

import pytest
import tempfile
import json
import hashlib
from pathlib import Path
import base64

from systems.pixel_compiler.pixelrts_v2_core import (
    PixelRTSEncoder,
    PixelRTSDecoder,
    PixelRTSMetadata,
)


def create_test_wasm() -> bytes:
    """Create a minimal valid WASM file for testing."""
    # WASM header + version
    header = b'\x00\x61\x73\x6d\x01\x00\x00\x00'

    # Type section
    type_section = b'\x01\x07\x01\x60\x02\x7f\x7f\x01\x7f'

    # Function section
    func_section = b'\x03\x02\x01\x00'

    # Export section (export "add")
    export_section = b'\x07\x07\x01\x03\x61\x64\x64\x00\x00'

    # Code section (add function)
    code_section = b'\x0a\x09\x01\x07\x00\x20\x00\x20\x01\x6a\x0b'

    return header + type_section + func_section + export_section + code_section


class TestCodeModeEncoding:
    """Test code-mode encoding."""

    def test_encoder_code_mode_initialization(self):
        """Test that encoder initializes in code mode."""
        encoder = PixelRTSEncoder(mode="code")
        assert encoder.mode == "code"

    def test_encoder_standard_mode_initialization(self):
        """Test that encoder initializes in standard mode."""
        encoder = PixelRTSEncoder(mode="standard")
        assert encoder.mode == "standard"

    def test_encoder_invalid_mode_raises(self):
        """Test that invalid mode raises ValueError."""
        with pytest.raises(ValueError, match="Invalid mode"):
            PixelRTSEncoder(mode="invalid")

    def test_encode_wasm_includes_original_data_b64(self):
        """Test that code-mode encoding includes original_data_b64 in metadata."""
        encoder = PixelRTSEncoder(mode="code")
        wasm = create_test_wasm()

        png_bytes = encoder.encode(wasm, grid_size=4)
        metadata = encoder.get_metadata()

        assert "original_data_b64" in metadata
        decoded_data = base64.b64decode(metadata["original_data_b64"])
        assert decoded_data == wasm

    def test_encode_standard_mode_no_original_data_b64(self):
        """Test that standard mode doesn't include original_data_b64."""
        encoder = PixelRTSEncoder(mode="standard")
        data = b"test data"

        png_bytes = encoder.encode(data, grid_size=2)
        metadata = encoder.get_metadata()

        # Standard mode doesn't need original_data_b64
        # (it can decode directly from pixels)
        assert "original_data_b64" not in metadata or metadata.get("encoding_mode") != "RGBA-dense"


class TestCodeModeDecoding:
    """Test code-mode decoding."""

    def test_decode_code_mode_with_original_data_b64(self):
        """Test decoding code-mode cartridge with original_data_b64."""
        encoder = PixelRTSEncoder(mode="code")
        decoder = PixelRTSDecoder()

        original_wasm = create_test_wasm()
        png_bytes = encoder.encode(original_wasm, grid_size=4)

        # Set metadata from encoder
        decoder.set_metadata(encoder.get_metadata())
        decoded = decoder.decode(png_bytes)

        assert decoded == original_wasm

    def test_decode_code_mode_raises_without_original_data_b64(self):
        """Test that decoding code-mode without original_data_b64 raises."""
        from PIL import Image
        import io
        import numpy as np

        # Create a minimal code-mode PNG without original_data_b64
        # Use actual data so the grid size matches
        pixel_array = np.zeros((2, 2, 4), dtype=np.uint8)
        img = Image.fromarray(pixel_array, mode='RGBA')

        buffer = io.BytesIO()
        from PIL import PngImagePlugin

        pnginfo = PngImagePlugin.PngInfo()
        # Create valid PixelRTS metadata prefix
        metadata_json = json.dumps({
            "format": "PixelRTS-2.0",
            "encoding": {"type": "RGBA-code"},
        })
        pnginfo.add_text("PixelRTS", "PixelRTS" + metadata_json)

        img.save(buffer, format='PNG', pnginfo=pnginfo)
        png_bytes = buffer.getvalue()

        decoder = PixelRTSDecoder()
        with pytest.raises(ValueError, match="Semantic decoding failed"):
            decoder.decode(png_bytes)

    def test_decode_standard_mode_works(self):
        """Test that standard mode decoding still works."""
        encoder = PixelRTSEncoder(mode="standard")
        decoder = PixelRTSDecoder()

        original_data = b"test data for standard mode"
        # Use larger grid size to fit the data
        png_bytes = encoder.encode(original_data, grid_size=4)
        decoded = decoder.decode(png_bytes)

        assert decoded == original_data


class TestCodeModeRoundTrip:
    """Test round-trip encoding/decoding."""

    def test_round_trip_code_mode(self):
        """Test round-trip encoding/decoding in code mode."""
        encoder = PixelRTSEncoder(mode="code")
        decoder = PixelRTSDecoder()

        original_wasm = create_test_wasm()
        original_hash = hashlib.sha256(original_wasm).hexdigest()

        # Encode
        png_bytes = encoder.encode(original_wasm, grid_size=4)
        metadata = encoder.get_metadata()

        # Decode
        decoder.set_metadata(metadata)
        decoded_wasm = decoder.decode(png_bytes)
        decoded_hash = hashlib.sha256(decoded_wasm).hexdigest()

        assert decoded_wasm == original_wasm
        assert decoded_hash == original_hash

    def test_round_trip_with_save_and_load(self):
        """Test round-trip with file save/load."""
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"

            encoder = PixelRTSEncoder(mode="code")
            decoder = PixelRTSDecoder()

            original_wasm = create_test_wasm()

            # Save
            encoder.save(original_wasm, str(png_path), grid_size=4, sidecar=True)

            # Load
            decoded_wasm = decoder.load(str(png_path))

            assert decoded_wasm == original_wasm


class TestCodeModeMetadata:
    """Test code-mode metadata handling."""

    def test_metadata_includes_code_mode(self):
        """Test that metadata indicates code mode."""
        encoder = PixelRTSEncoder(mode="code")
        wasm = create_test_wasm()

        encoder.encode(wasm, grid_size=4)
        metadata = encoder.get_metadata()

        assert metadata.get("encoding_mode") == "RGBA-code"

    def test_metadata_includes_data_hash(self):
        """Test that metadata includes data hash."""
        encoder = PixelRTSEncoder(mode="code")
        wasm = create_test_wasm()

        encoder.encode(wasm, grid_size=4)
        metadata = encoder.get_metadata()

        expected_hash = PixelRTSMetadata.hash_data(wasm)
        assert metadata.get("data_hash") == expected_hash

    def test_metadata_includes_data_size(self):
        """Test that metadata includes data size."""
        encoder = PixelRTSEncoder(mode="code")
        wasm = create_test_wasm()

        encoder.encode(wasm, grid_size=4)
        metadata = encoder.get_metadata()

        assert metadata.get("data_size") == len(wasm)


class TestCodeModeWithWasmExtractor:
    """Test code-mode cartridges with WASMExtractor."""

    def test_extract_from_code_mode_cartridge(self):
        """Test WASM extraction from code-mode cartridge."""
        from systems.pixel_compiler.wasm_extractor import WASMExtractor

        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"

            encoder = PixelRTSEncoder(mode="code")
            original_wasm = create_test_wasm()

            encoder.save(original_wasm, str(png_path), grid_size=4, sidecar=True)

            # Extract using WASMExtractor
            extractor = WASMExtractor()
            extracted = extractor.extract_from_file(str(png_path))

            assert extracted == original_wasm

    def test_validate_wasm_after_extraction(self):
        """Test that extracted WASM is valid."""
        from systems.pixel_compiler.wasm_extractor import WASMExtractor

        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"

            encoder = PixelRTSEncoder(mode="code")
            original_wasm = create_test_wasm()

            encoder.save(original_wasm, str(png_path), grid_size=4, sidecar=True)

            # Extract and validate
            extractor = WASMExtractor()
            extracted = extractor.extract_from_file(str(png_path))

            # Check WASM magic
            assert extracted[:4] == b'\x00\x61\x73\x6d'

            # Parse exports
            exports = extractor._parse_wasm_exports(extracted)
            assert "add" in exports


class TestMergedMetadata:
    """Test metadata merging from PNG and sidecar."""

    def test_decoder_prefers_png_metadata_for_original_data(self):
        """Test that decoder merges metadata preferring PNG for original_data_b64."""
        from PIL import Image
        import io
        import numpy as np

        # Create test data
        original_wasm = create_test_wasm()

        # Create PNG with embedded metadata including original_data_b64
        encoder = PixelRTSEncoder(mode="code")
        png_bytes = encoder.encode(original_wasm, grid_size=4)

        # Create sidecar WITHOUT original_data_b64 (legacy scenario)
        with tempfile.TemporaryDirectory() as tmpdir:
            png_path = Path(tmpdir) / "test.rts.png"
            meta_path = Path(tmpdir) / "test.rts.meta.json"

            # Save PNG
            with open(png_path, 'wb') as f:
                f.write(png_bytes)

            # Save sidecar without original_data_b64
            sidecar_meta = {
                "format": "PixelRTS-2.0",
                "mode": "code",
                "encoding": {"type": "RGBA-code"},
                "data_hash": PixelRTSMetadata.hash_data(original_wasm),
            }
            with open(meta_path, 'w') as f:
                json.dump(sidecar_meta, f)

            # Load and decode - should work because PNG has original_data_b64
            decoder = PixelRTSDecoder()
            decoded = decoder.load(str(png_path))

            assert decoded == original_wasm


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

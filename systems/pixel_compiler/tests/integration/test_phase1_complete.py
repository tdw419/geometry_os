"""
Integration test for Phase 1 completion.
Tests code-mode encoding/decoding and memory management.
"""
import pytest
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder
from systems.pixel_compiler.wasm_runtime import WASMRuntime
import tempfile
import os


def create_simple_wasm():
    """Create a minimal WASM file for testing"""
    # Minimal WASM that returns a constant
    return (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03run\x00\x00'  # export "run"
        b'\x0a\x06\x01\x04\x00\x41\x2a\x0b'  # code: i32.const 42, end
    )


def test_phase1_code_mode_roundtrip():
    """Test complete code-mode encode/decode cycle with semantic decoding"""
    wasm = create_simple_wasm()

    with tempfile.TemporaryDirectory() as tmpdir:
        png_path = os.path.join(tmpdir, "test.rts.png")
        meta_path = os.path.join(tmpdir, "test.rts.meta.json")

        # Encode in code mode
        encoder = PixelRTSEncoder(mode="code")
        encoder.save(wasm, png_path)

        # Load metadata and remove original_data_b64 to test semantic decoding
        import json
        if os.path.exists(meta_path):
            with open(meta_path, 'r') as f:
                metadata = json.load(f)
            if 'original_data_b64' in metadata:
                del metadata['original_data_b64']
            with open(meta_path, 'w') as f:
                json.dump(metadata, f)

        # Decode using semantic decoding
        decoder = PixelRTSDecoder()
        decoded = decoder.load(png_path)

        # Verify exact match
        assert decoded == wasm, f"Decoded data mismatch: {len(decoded)} vs {len(wasm)}"


def test_phase1_auto_mode_detection():
    """Test that decoder automatically detects standard vs code mode"""
    standard_data = b"Standard mode test data"
    wasm_data = create_simple_wasm()

    with tempfile.TemporaryDirectory() as tmpdir:
        standard_path = os.path.join(tmpdir, "standard.rts.png")
        code_path = os.path.join(tmpdir, "code.rts.png")

        # Encode standard mode
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(standard_data, standard_path)

        # Encode code mode
        encoder = PixelRTSEncoder(mode="code")
        encoder.save(wasm_data, code_path)

        # Decode both - decoder should auto-detect
        decoder = PixelRTSDecoder()

        decoded_standard = decoder.load(standard_path)
        assert decoded_standard == standard_data

        decoded_code = decoder.load(code_path)
        assert decoded_code == wasm_data


def test_phase1_memory_usage_tracking():
    """Test that get_memory_usage() returns correct information"""
    wasm = create_simple_wasm()

    with tempfile.TemporaryDirectory() as tmpdir:
        png_path = os.path.join(tmpdir, "test.rts.png")

        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path)

        runtime = WASMRuntime.from_png(png_path)

        # Execute a function first - this configures memory
        result = runtime.call("run")
        assert result == 42

        # Check memory usage after execution
        usage = runtime.get_memory_usage()
        assert "pages" in usage
        assert "bytes" in usage
        assert usage["pages"] >= 1
        assert usage["bytes"] == usage["pages"] * 65536


def test_phase1_memory_snapshot_restore():
    """Test memory snapshot and restore functionality"""
    wasm = create_simple_wasm()

    with tempfile.TemporaryDirectory() as tmpdir:
        png_path = os.path.join(tmpdir, "test.rts.png")

        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path)

        runtime = WASMRuntime.from_png(png_path)

        # Take snapshot before execution
        snapshot1 = runtime.snapshot_memory()
        assert len(snapshot1) > 0, "Snapshot should contain memory data"

        # Execute function
        result = runtime.call("run")
        assert result == 42  # Our WASM returns 42

        # Take second snapshot
        snapshot2 = runtime.snapshot_memory()
        assert len(snapshot2) > 0, "Second snapshot should contain memory data"

        # Restore from first snapshot
        runtime.restore_memory(snapshot1)

        # Function should still work after restore
        result2 = runtime.call("run")
        assert result2 == 42, "Function should work after restore"


def test_phase1_wasm_runtime_api():
    """Test WASMRuntime API completeness"""
    wasm = create_simple_wasm()

    with tempfile.TemporaryDirectory() as tmpdir:
        png_path = os.path.join(tmpdir, "test.rts.png")

        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path)

        runtime = WASMRuntime.from_png(png_path)

        # Test exports are parsed
        assert "run" in runtime.exports

        # Test function call
        result = runtime.call("run")
        assert result == 42

        # Test get_loaded_path
        assert runtime.get_loaded_path() == png_path


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

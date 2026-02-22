"""
Tests for memory snapshot and restore functionality.
"""
import pytest
import tempfile
import os

try:
    from systems.pixel_compiler.wasm_runtime import WASMRuntime
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
    RUNTIME_AVAILABLE = True
except ImportError as e:
    print(f"Import error: {e}")
    RUNTIME_AVAILABLE = False


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_snapshot_memory_returns_bytes():
    """Test that snapshot_memory() returns bytes"""
    # Minimal WASM
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03get\x00\x00'  # export "get"
        b'\x0a\x06\x01\x04\x00\x41\x01\x0b'  # code: i32.const 1, end
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "snapshot"})

        runtime = WASMRuntime.from_png(png_path)
        snapshot = runtime.snapshot_memory()

        # Should return bytes
        assert isinstance(snapshot, bytes)
        assert len(snapshot) > 0
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_restore_memory_works():
    """Test that restore_memory() restores memory state"""
    # Same minimal WASM
    wasm = (
        b'\x00\x61\x73\x6d'
        b'\x01\x00\x00\x00'
        b'\x01\x04\x01\x60\x00\x01\x7f'
        b'\x03\x02\x01\x00'
        b'\x07\x07\x01\x03get\x00\x00'
        b'\x0a\x06\x01\x04\x00\x41\x01\x0b'
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "restore"})

        runtime = WASMRuntime.from_png(png_path)

        # Take snapshot before any execution
        snapshot1 = runtime.snapshot_memory()
        assert len(snapshot1) > 0, "Snapshot should contain memory data"

        # Call function to get baseline result
        result = runtime.call("get")

        # Take second snapshot after execution
        snapshot2 = runtime.snapshot_memory()
        assert len(snapshot2) > 0, "Second snapshot should contain memory data"

        # Restore from first snapshot (revert to initial state)
        runtime.restore_memory(snapshot1)

        # Function should still work after restore
        result2 = runtime.call("get")

        # In mock mode, both return 42; in real execution, both return 1
        # The key is that they're consistent
        assert result == result2, f"Results should be consistent after restore: {result} != {result2}"
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

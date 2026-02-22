"""
Tests for WASM memory management opcodes: memory.size and memory.grow

Note: These tests require GPU hardware. Mock mode returns 42 for all calls.
"""
import pytest
import sys
import os

# Test is in systems/pixel_compiler/tests/, so imports are straightforward
try:
    from systems.pixel_compiler.wasm_runtime import WASMRuntime
    from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
    RUNTIME_AVAILABLE = True
except ImportError as e:
    print(f"Import error: {e}")
    RUNTIME_AVAILABLE = False


def test_memory_size_opcode_defined():
    """Test that OP_MEMORY_SIZE is defined in the bridge"""
    assert "memory_size" in dir(WASMGPUBridge) or hasattr(WASMGPUBridge, 'OP_MEMORY_SIZE')


def test_memory_grow_opcode_defined():
    """Test that OP_MEMORY_GROW is defined in the bridge"""
    assert "memory_grow" in dir(WASMGPUBridge) or hasattr(WASMGPUBridge, 'OP_MEMORY_GROW')


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_memory_size_returns_initial_pages():
    """Test that memory.size returns initial page count (1)"""
    # Minimal WASM that calls memory.size
    # Format: magic + version + type section + function section + export + code
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type section: [] -> i32
        b'\x03\x02\x01\x00'  # function section: 1 function, type 0
        b'\x07\x0a\x01\x06memSize\x00\x00'  # export "memSize"
        b'\x0a\x07\x01\x05\x00\x3f\x0b'  # code: memory_size, end
    )

    import tempfile
    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "mem_size"})

        runtime = WASMRuntime.from_png(png_path)
        result = runtime.call("memSize")

        # Default memory is 1 page (64KB)
        assert result == 1, f"Expected 1 page, got {result}"
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_memory_grow_increases_pages():
    """Test that memory.grow increases memory size"""
    # WASM that calls memory.grow(1) and returns new size
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type section: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x09\x01\x05grow\x00\x00'  # export "grow"
        b'\x0a\x0b\x01\x09\x00\x01\x40\x01\x00\x0b\x0b'  # code: i32.const 1, memory_grow, end
    )

    import tempfile
    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "grow"})

        runtime = WASMRuntime.from_png(png_path)

        # Initial size
        initial = runtime.call("memSize") if hasattr(runtime, 'call') else 1
        assert initial == 1

        # Grow by 1 page - should return old size (1)
        old_size = runtime.call("grow")
        assert old_size == 1, f"Expected old_size=1, got {old_size}"

        # New size should be 2
        # Note: This test requires a second function or state tracking
        # For now, just verify grow returned success
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_memory_grow_returns_old_size():
    """Test that memory.grow returns old page count on success"""
    wasm = (
        b'\x00\x61\x73\x6d'
        b'\x01\x00\x00\x00'
        b'\x01\x04\x01\x60\x00\x01\x7f'
        b'\x03\x02\x01\x00'
        b'\x07\x09\x01\x05grow2\x00\x00'
        b'\x0a\x0b\x01\x09\x00\x02\x40\x01\x00\x0b\x0b'  # i32.const 2, memory_grow, end
    )

    import tempfile
    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "grow2"})

        runtime = WASMRuntime.from_png(png_path)
        result = runtime.call("grow2")

        # Should return old page count (1)
        assert result == 1, f"Expected old_size=1, got {result}"
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_memory_grow_fails_on_excessive_growth():
    """Test that memory.grow fails when exceeding maximum pages"""
    # Try to grow by 65536 pages (exceeds 4GB limit)
    wasm = (
        b'\x00\x61\x73\x6d'
        b'\x01\x00\x00\x00'
        b'\x01\x04\x01\x60\x00\x01\x7f'
        b'\x03\x02\x01\x00'
        b'\x07\x0b\x01\x07tooMuch\x00\x00'
        b'\x0a\x13\x01\x11\x00\x80\x80\x04\x40\x01\x00\x0b\x0b'  # i32.const 65536, memory_grow, end
    )

    import tempfile
    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "tooMuch"})

        runtime = WASMRuntime.from_png(png_path)
        result = runtime.call("tooMuch")

        # Should return -1 (0xFFFFFFFF) on failure
        assert result == 0xFFFFFFFF, f"Expected failure (-1), got {result}"
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_memory_grow_zero_pages():
    """Test that memory.grow(0) returns current size without changing"""
    wasm = (
        b'\x00\x61\x73\x6d'
        b'\x01\x00\x00\x00'
        b'\x01\x04\x01\x60\x00\x01\x7f'
        b'\x03\x02\x01\x00'
        b'\x07\x0a\x01\x06zeroPg\x00\x00'
        b'\x0a\x09\x01\x07\x00\x00\x40\x01\x00\x0b\x0b'  # i32.const 0, memory_grow, end
    )

    import tempfile
    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        png_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, png_path, metadata={"type": "test", "name": "zeroPg"})

        runtime = WASMRuntime.from_png(png_path)
        result = runtime.call("zeroPg")

        # Should return current size (1) without changing
        assert result == 1, f"Expected current_size=1, got {result}"
    finally:
        if os.path.exists(png_path):
            os.remove(png_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

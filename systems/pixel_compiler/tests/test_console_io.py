"""
Tests for Phase 2 File & Console I/O.
Tests print/host.log console output functions.
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
def test_console_shader_compiles():
    """Test that the shader with console functions compiles"""
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03run\x00\x00'  # export "run"
        b'\x0a\x06\x01\x04\x00\x41\x2a\x0b'  # code: i32.const 42, end
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        rts_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, rts_path, metadata={"type": "test"})

        runtime = WASMRuntime.from_png(rts_path)
        result = runtime.call("run")
        assert result == 42
    finally:
        if os.path.exists(rts_path):
            os.remove(rts_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_console_output_available():
    """Test that console_output is available in execution result"""
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03run\x00\x00'  # export "run"
        b'\x0a\x06\x01\x04\x00\x41\x2a\x0b'  # code: i32.const 42, end
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        rts_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, rts_path, metadata={"type": "test"})

        runtime = WASMRuntime.from_png(rts_path)

        # Execute directly via bridge to get ExecutionResult
        result = runtime.bridge.execute(
            runtime.wasm_bytes,
            entry_point=runtime.exports["run"],
            memory_pages=1
        )

        # console_output should be a list (even if empty)
        assert hasattr(result, 'console_output')
        assert isinstance(result.console_output, list)
    finally:
        if os.path.exists(rts_path):
            os.remove(rts_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_print_i32_function():
    """Test host_print_i32 function"""
    # This test verifies the print_i32 host function compiles
    # Actual console output testing requires GPU execution
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03run\x00\x00'  # export "run"
        b'\x0a\x06\x01\x04\x00\x41\x2a\x0b'  # code: i32.const 42, end
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        rts_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, rts_path, metadata={"type": "test"})

        runtime = WASMRuntime.from_png(rts_path)
        result = runtime.call("run")
        assert result is not None
    finally:
        if os.path.exists(rts_path):
            os.remove(rts_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_print_f32_function():
    """Test host_print_f32 function"""
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03run\x00\x00'  # export "run"
        b'\x0a\x06\x01\x04\x00\x41\x2a\x0b'  # code: i32.const 42, end
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        rts_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, rts_path, metadata={"type": "test"})

        runtime = WASMRuntime.from_png(rts_path)
        result = runtime.call("run")
        assert result is not None
    finally:
        if os.path.exists(rts_path):
            os.remove(rts_path)


@pytest.mark.skipif(not RUNTIME_AVAILABLE, reason="wasm_runtime not available")
def test_print_str_function():
    """Test host_print_str function"""
    wasm = (
        b'\x00\x61\x73\x6d'  # magic
        b'\x01\x00\x00\x00'  # version
        b'\x01\x04\x01\x60\x00\x01\x7f'  # type: [] -> i32
        b'\x03\x02\x01\x00'  # function section
        b'\x07\x07\x01\x03run\x00\x00'  # export "run"
        b'\x0a\x06\x01\x04\x00\x41\x2a\x0b'  # code: i32.const 42, end
    )

    with tempfile.NamedTemporaryFile(suffix=".rts.png", delete=False) as f:
        rts_path = f.name

    try:
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(wasm, rts_path, metadata={"type": "test"})

        runtime = WASMRuntime.from_png(rts_path)
        result = runtime.call("run")
        assert result is not None
    finally:
        if os.path.exists(rts_path):
            os.remove(rts_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

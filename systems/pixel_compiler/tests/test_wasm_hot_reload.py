#!/usr/bin/env python3
"""Tests for WASM hot reload functionality"""
import pytest
import sys
import tempfile
from pathlib import Path

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.pixel_compiler.wasm_runtime import WASMRuntime
import struct


def create_test_rts_png(wasm_bytes: bytes, path: str):
    """Create a minimal .rts.png with WASM embedded"""
    from pixelrts_v2_core import PixelRTSEncoder

    # Use the PixelRTS v2 encoder to create a proper PNG
    encoder = PixelRTSEncoder(mode="code")
    encoder.save(data=wasm_bytes, output_path=path)


def test_runtime_has_reload_method():
    """Test that runtime has reload method"""
    runtime = WASMRuntime()
    assert hasattr(runtime, 'reload')


def test_runtime_reload_from_file():
    """Test reloading WASM from file"""
    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        rts_path = f.name

    try:
        # Create initial WASM
        wasm_v1 = b'\x00asm\x01\x00\x00\x00'
        create_test_rts_png(wasm_v1, rts_path)

        runtime = WASMRuntime.from_png(rts_path)

        # Store initial WASM size
        initial_size = len(runtime.wasm_bytes)

        # Create updated WASM
        wasm_v2 = b'\x00asm\x01\x00\x00\x00' + b'\x00' * 10
        create_test_rts_png(wasm_v2, rts_path)

        # Reload
        runtime.reload(rts_path)

        # Verify WASM was reloaded
        assert len(runtime.wasm_bytes) != initial_size

    finally:
        Path(rts_path).unlink()


def test_runtime_reload_preserves_exports():
    """Test that reload updates exports"""
    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        rts_path = f.name

    try:
        wasm_v1 = b'\x00asm\x01\x00\x00\x00'
        create_test_rts_png(wasm_v1, rts_path)

        runtime = WASMRuntime.from_png(rts_path)

        # Reload
        runtime.reload(rts_path)

        # Exports should be updated
        assert runtime.exports is not None

    finally:
        Path(rts_path).unlink()


def test_runtime_reload_preserves_settings():
    """Test that reload preserves runtime settings"""
    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        rts_path = f.name

    try:
        wasm_v1 = b'\x00asm\x01\x00\x00\x00'
        create_test_rts_png(wasm_v1, rts_path)

        runtime = WASMRuntime.from_png(rts_path)
        runtime.max_instructions = 50000
        runtime.memory_pages = 2

        # Reload
        runtime.reload(rts_path)

        # Settings should be preserved
        assert runtime.max_instructions == 50000
        assert runtime.memory_pages == 2

    finally:
        Path(rts_path).unlink()


def test_runtime_reload_with_wasm_bytes():
    """Test reloading with direct WASM bytes"""
    runtime = WASMRuntime()

    wasm_v1 = b'\x00asm\x01\x00\x00\x00'
    runtime.wasm_bytes = wasm_v1
    runtime.exports = {}

    wasm_v2 = b'\x00asm\x01\x00\x00\x00' + b'\x00' * 10
    runtime.reload_bytes(wasm_v2)

    assert runtime.wasm_bytes == wasm_v2


def test_runtime_on_reload_callback():
    """Test on_reload callback is called"""
    runtime = WASMRuntime()

    callback_called = []

    def on_reload(old_bytes, new_bytes):
        callback_called.append(True)
        assert len(old_bytes) < len(new_bytes)

    runtime.set_on_reload_callback(on_reload)

    wasm_v1 = b'\x00asm\x01\x00\x00\x00'
    runtime.wasm_bytes = wasm_v1

    wasm_v2 = b'\x00asm\x01\x00\x00\x00' + b'\x00' * 10
    runtime.reload_bytes(wasm_v2)

    assert len(callback_called) == 1

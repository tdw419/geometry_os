"""
Tests for WASM GPU Memory Management (Task 2.1)

Tests the memory management API of WASMGPUBridge:
- configure_memory(pages: int) - Allocate 64KB pages
- write_memory(offset: int, data: bytes) - Write with bounds checking
- read_memory(offset: int, size: int) - Read with GPU sync

Follows TDD approach - tests written before implementation.
"""

import pytest
import tempfile
from pathlib import Path


class TestGPUMemoryManagement:
    """Test suite for GPU memory management methods."""

    def test_configure_memory_single_page(self):
        """Test configuring a single memory page (64KB)."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Configure 1 page of memory
        bridge.configure_memory(pages=1)

        # Should allocate 64KB
        assert bridge.memory_pages == 1
        assert bridge.memory_size == 64 * 1024
        # In mock mode, memory_buffer is None, but _memory_data should be set
        if bridge.mock:
            assert len(bridge._memory_data) == 64 * 1024
        else:
            assert bridge.memory_buffer is not None

    def test_configure_memory_multiple_pages(self):
        """Test configuring multiple memory pages."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # Configure 4 pages of memory
        bridge.configure_memory(pages=4)

        # Should allocate 256KB
        assert bridge.memory_pages == 4
        assert bridge.memory_size == 4 * 64 * 1024
        # In mock mode, check _memory_data
        if bridge.mock:
            assert len(bridge._memory_data) == 4 * 64 * 1024
        else:
            assert bridge.memory_buffer is not None

    def test_configure_memory_zero_pages_fails(self):
        """Test that configuring 0 pages raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        with pytest.raises(ValueError, match="pages must be positive"):
            bridge.configure_memory(pages=0)

    def test_configure_memory_negative_pages_fails(self):
        """Test that configuring negative pages raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        with pytest.raises(ValueError, match="pages must be positive"):
            bridge.configure_memory(pages=-1)

    def test_configure_memory_too_many_pages_fails(self):
        """Test that configuring too many pages raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()

        # WASM spec limits memory to 65536 pages (4GB)
        # We'll set a reasonable limit for testing
        with pytest.raises(ValueError, match="too many pages"):
            bridge.configure_memory(pages=65537)

    def test_write_memory_single_byte(self):
        """Test writing a single byte to memory."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write a single byte
        bridge.write_memory(offset=0, data=b'\x42')

        # In mock mode, verify the write happened
        if bridge.mock:
            assert bridge._memory_data[0] == 0x42
        else:
            assert bridge.memory_buffer is not None

    def test_write_memory_multiple_bytes(self):
        """Test writing multiple bytes to memory."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write multiple bytes
        data = b'\xDE\xAD\xBE\xEF'
        bridge.write_memory(offset=0, data=data)

        # In mock mode, verify the write
        if bridge.mock:
            assert bridge._memory_data[0:4] == data
        else:
            assert bridge.memory_buffer is not None

    def test_write_memory_at_offset(self):
        """Test writing at a specific offset."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write at offset 100
        data = b'\xCA\xFE'
        bridge.write_memory(offset=100, data=data)

        # In mock mode, verify the write
        if bridge.mock:
            assert bridge._memory_data[100:102] == data
        else:
            assert bridge.memory_buffer is not None

    def test_write_memory_out_of_bounds(self):
        """Test that writing beyond memory bounds raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)  # 64KB

        # Try to write beyond memory
        with pytest.raises(ValueError, match="out of bounds"):
            bridge.write_memory(offset=64 * 1024, data=b'\x00')

    def test_write_memory_extends_past_bounds(self):
        """Test that writing data that extends beyond bounds raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)  # 64KB

        # Write data that extends beyond memory
        with pytest.raises(ValueError, match="out of bounds"):
            bridge.write_memory(offset=64 * 1024 - 1, data=b'\x00\x00')

    def test_write_memory_empty_data(self):
        """Test writing empty data (should succeed)."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Writing empty data should not raise
        bridge.write_memory(offset=0, data=b'')

    def test_read_memory_single_byte(self):
        """Test reading a single byte from memory."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # First write some data
        bridge.write_memory(offset=0, data=b'\x42')

        # Read it back
        data = bridge.read_memory(offset=0, size=1)
        assert data == b'\x42'

    def test_read_memory_multiple_bytes(self):
        """Test reading multiple bytes from memory."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write test pattern
        test_data = b'\xDE\xAD\xBE\xEF'
        bridge.write_memory(offset=0, data=test_data)

        # Read it back
        data = bridge.read_memory(offset=0, size=4)
        assert data == test_data

    def test_read_memory_at_offset(self):
        """Test reading from a specific offset."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write at offset 100
        test_data = b'\xCA\xFE'
        bridge.write_memory(offset=100, data=test_data)

        # Read from offset 100
        data = bridge.read_memory(offset=100, size=2)
        assert data == test_data

    def test_read_memory_out_of_bounds(self):
        """Test that reading beyond memory bounds raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)  # 64KB

        # Try to read beyond memory
        with pytest.raises(ValueError, match="out of bounds"):
            bridge.read_memory(offset=64 * 1024, size=1)

    def test_read_memory_extends_past_bounds(self):
        """Test that reading data that extends beyond bounds raises an error."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)  # 64KB

        # Read data that extends beyond memory
        with pytest.raises(ValueError, match="out of bounds"):
            bridge.read_memory(offset=64 * 1024 - 1, size=2)

    def test_read_write_roundtrip(self):
        """Test that write and read operations are consistent."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write test pattern at various offsets
        patterns = [
            (0, b'\x00\x01\x02\x03'),
            (100, b'\xAA\xBB\xCC\xDD'),
            (1000, b'\xFF\xFF\xFF\xFF'),
        ]

        for offset, data in patterns:
            bridge.write_memory(offset=offset, data=data)
            read_back = bridge.read_memory(offset=offset, size=len(data))
            assert read_back == data

    def test_memory_state_persists(self):
        """Test that memory state persists between operations."""
        from systems.pixel_compiler.wasm_gpu_bridge import WASMGPUBridge

        bridge = WASMGPUBridge()
        bridge.configure_memory(pages=1)

        # Write data
        bridge.write_memory(offset=0, data=b'\x01\x02\x03\x04')
        bridge.write_memory(offset=4, data=b'\x05\x06\x07\x08')

        # Read it back
        data = bridge.read_memory(offset=0, size=8)
        assert data == b'\x01\x02\x03\x04\x05\x06\x07\x08'


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

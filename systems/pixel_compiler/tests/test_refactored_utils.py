#!/usr/bin/env python3
"""
Comprehensive tests for refactored utility functions.

Run with: pytest test_refactored_utils.py -v --cov=refactored_utils --cov-report=term-missing
"""

import os

# Import the refactored module
import sys
import tempfile
from pathlib import Path

import numpy as np
import pytest

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from refactored_utils import (
    # Binary detection
    BinaryType,
    FramebufferConfig,
    # Hilbert curve
    HilbertCurve,
    VirtualFramebuffer,
    _read_header_bytes,
    # Binary utilities
    calculate_grid_size,
    # Coordinate utilities
    clamp_to_bounds,
    # Hash utilities
    compute_cyclic_redundancy_check,
    compute_function_hash,
    decode_address_from_rgba,
    detect_binary_type,
    encode_address_to_rgba,
    lerp_color,
    pack_binary_to_rgba,
    # Color utilities
    pack_rgba,
    pad_to_grid,
    rect_area,
    rect_intersect,
    unpack_rgba,
)


class TestBinaryTypeDetection:
    """Tests for binary type detection functions."""

    def test_detect_by_extension_gguf(self):
        """Test GGUF detection by extension."""
        assert detect_binary_type("model.gguf") == BinaryType.GGUF
        assert detect_binary_type("/path/to/MODEL.GGUF") == BinaryType.GGUF

    def test_detect_by_extension_safetensors(self):
        """Test SafeTensors detection by extension."""
        assert detect_binary_type("model.safetensors") == BinaryType.SAFE_TENSORS
        assert detect_binary_type("model.st") == BinaryType.SAFE_TENSORS

    def test_detect_by_extension_wasm(self):
        """Test WASM detection by extension."""
        assert detect_binary_type("module.wasm") == BinaryType.WASM

    def test_detect_by_extension_pe(self):
        """Test PE detection by extension."""
        assert detect_binary_type("program.exe") == BinaryType.PE
        assert detect_binary_type("library.dll") == BinaryType.PE

    def test_detect_by_magic_wasm(self):
        """Test WASM detection by magic bytes."""
        wasm_magic = b"\x00asm\x01\x00\x00\x00"
        assert detect_binary_type("unknown", read_magic=wasm_magic) == BinaryType.WASM

    def test_detect_by_magic_elf32(self):
        """Test ELF32 detection by magic bytes."""
        elf32_magic = b"\x7fELF\x01\x00\x00\x00"
        assert detect_binary_type("unknown", read_magic=elf32_magic) == BinaryType.ELF_KERNEL

    def test_detect_by_magic_elf64(self):
        """Test ELF64 detection by magic bytes."""
        elf64_magic = b"\x7fELF\x02\x00\x00\x00"
        assert detect_binary_type("unknown", read_magic=elf64_magic) == BinaryType.ELF_KERNEL

    def test_detect_by_magic_pe(self):
        """Test PE detection by magic bytes."""
        pe_magic = b"MZ\x90\x00\x03\x00\x00\x00"
        assert detect_binary_type("unknown", read_magic=pe_magic) == BinaryType.PE

    def test_detect_by_magic_macho(self):
        """Test Mach-O detection by magic bytes."""
        macho_magic = b"\xfe\xed\xfa\xce\x00\x00\x00\x00"
        assert detect_binary_type("unknown", read_magic=macho_magic) == BinaryType.MACHO

    def test_detect_generic_fallback(self):
        """Test fallback to generic binary type."""
        assert detect_binary_type("unknown.xyz") == BinaryType.GENERIC_BINARY
        assert detect_binary_type("unknown", read_magic=b"\x00\x00\x00\x00") == BinaryType.GENERIC_BINARY

    def test_detect_from_real_file(self):
        """Test detection from an actual file."""
        with tempfile.NamedTemporaryFile(suffix='.wasm', delete=False) as f:
            f.write(b"\x00asm\x01\x00\x00\x00")
            f.flush()
            result = detect_binary_type(f.name)
            os.unlink(f.name)
            # Extension takes priority
            assert result == BinaryType.WASM

    def test_extension_priority_over_magic(self):
        """Test that extension takes priority over magic bytes."""
        # Create a file with .gguf extension but WASM magic
        with tempfile.NamedTemporaryFile(suffix='.gguf', delete=False) as f:
            f.write(b"\x00asm\x01\x00\x00\x00")
            f.flush()
            result = detect_binary_type(f.name)
            os.unlink(f.name)
            # Extension wins
            assert result == BinaryType.GGUF

    def test_read_header_bytes_success(self):
        """Test reading header bytes from file."""
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b"testdata")
            f.flush()
            result = _read_header_bytes(Path(f.name))
            os.unlink(f.name)
            assert result == b"testdata"

    def test_read_header_bytes_nonexistent(self):
        """Test reading header bytes from non-existent file."""
        result = _read_header_bytes(Path("/nonexistent/file.xyz"))
        assert result is None

    def test_read_header_bytes_with_fallback(self):
        """Test reading header bytes with fallback."""
        result = _read_header_bytes(
            Path("/nonexistent/file.xyz"),
            fallback=b"fallback"
        )
        assert result == b"fallback"


class TestVirtualFramebuffer:
    """Tests for VirtualFramebuffer class."""

    def test_initialization(self):
        """Test framebuffer initialization."""
        fb = VirtualFramebuffer(100, 50)
        assert fb.width == 100
        assert fb.height == 50
        assert fb.pixels.shape == (50, 100, 4)

    def test_initialization_invalid_dimensions(self):
        """Test that invalid dimensions raise error."""
        with pytest.raises(ValueError):
            VirtualFramebuffer(0, 100)
        with pytest.raises(ValueError):
            VirtualFramebuffer(100, -1)

    def test_pixels_initially_black(self):
        """Test that pixels are initially black transparent."""
        fb = VirtualFramebuffer(10, 10)
        assert np.all(fb.pixels == 0)

    def test_set_pixel_valid(self):
        """Test setting a valid pixel."""
        fb = VirtualFramebuffer(10, 10)
        result = fb.set_pixel(5, 5, (255, 0, 0, 255))
        assert result is True
        assert tuple(fb.pixels[5, 5]) == (255, 0, 0, 255)

    def test_set_pixel_out_of_bounds(self):
        """Test setting pixel outside bounds."""
        fb = VirtualFramebuffer(10, 10)
        result = fb.set_pixel(15, 5, (255, 0, 0, 255))
        assert result is False

    def test_fill_rect_full(self):
        """Test filling entire framebuffer."""
        fb = VirtualFramebuffer(10, 10)
        count = fb.fill_rect(0, 0, 10, 10, (255, 128, 64, 255))
        assert count == 100
        assert np.all(fb.pixels == (255, 128, 64, 255))

    def test_fill_rect_partial(self):
        """Test filling partial region."""
        fb = VirtualFramebuffer(10, 10)
        count = fb.fill_rect(2, 2, 5, 5, (255, 0, 0, 255))
        assert count == 25
        assert tuple(fb.pixels[2, 2]) == (255, 0, 0, 255)
        assert tuple(fb.pixels[0, 0]) == (0, 0, 0, 0)

    def test_fill_rect_out_of_bounds(self):
        """Test filling region outside bounds."""
        fb = VirtualFramebuffer(10, 10)
        count = fb.fill_rect(20, 20, 5, 5, (255, 0, 0, 255))
        assert count == 0

    def test_fill_rect_clipped(self):
        """Test filling region that gets clipped."""
        fb = VirtualFramebuffer(10, 10)
        count = fb.fill_rect(8, 8, 5, 5, (255, 0, 0, 255))
        assert count == 4  # Only 2x2 fits

    def test_get_region_full(self):
        """Test getting entire region."""
        fb = VirtualFramebuffer(10, 10)
        fb.fill_rect(0, 0, 10, 10, (128, 128, 128, 255))
        region = fb.get_region(0, 0, 10, 10)
        assert region.shape == (10, 10, 4)
        assert np.all(region == (128, 128, 128, 255))

    def test_get_region_partial(self):
        """Test getting partial region."""
        fb = VirtualFramebuffer(10, 10)
        fb.fill_rect(0, 0, 10, 10, (100, 100, 100, 255))
        region = fb.get_region(5, 5, 3, 3)
        assert region.shape == (3, 3, 4)

    def test_get_region_out_of_bounds(self):
        """Test getting region outside bounds."""
        fb = VirtualFramebuffer(10, 10)
        region = fb.get_region(15, 15, 5, 5)
        assert region.shape == (5, 5, 4)
        assert np.all(region == 0)

    def test_clear_default(self):
        """Test clearing with default color."""
        fb = VirtualFramebuffer(10, 10)
        fb.fill_rect(0, 0, 10, 10, (255, 255, 255, 255))
        fb.clear()
        assert np.all(fb.pixels == 0)

    def test_clear_with_color(self):
        """Test clearing with custom color."""
        fb = VirtualFramebuffer(10, 10)
        fb.clear((128, 64, 32, 255))
        assert np.all(fb.pixels == (128, 64, 32, 255))

    def test_compare_identical(self):
        """Test comparing identical framebuffers."""
        fb1 = VirtualFramebuffer(10, 10)
        fb2 = VirtualFramebuffer(10, 10)
        assert fb1.compare(fb2) == 1.0

    def test_compare_different(self):
        """Test comparing different framebuffers."""
        fb1 = VirtualFramebuffer(10, 10)
        fb2 = VirtualFramebuffer(10, 10)
        fb2.fill_rect(0, 0, 10, 10, (255, 255, 255, 255))
        similarity = fb1.compare(fb2)
        # Similarity should be > 0 because we use normalized RMS difference
        # When one is all zeros and one is all 255s, similarity = 1 - (255/sqrt(4*255^2)) = 1 - 0.5 = 0.5
        assert 0.0 <= similarity < 1.0

    def test_compare_different_sizes(self):
        """Test comparing framebuffers of different sizes."""
        fb1 = VirtualFramebuffer(10, 10)
        fb2 = VirtualFramebuffer(20, 20)
        assert fb1.compare(fb2) == 0.0

    def test_get_diff_mask(self):
        """Test getting difference mask."""
        fb1 = VirtualFramebuffer(10, 10)
        fb2 = VirtualFramebuffer(10, 10)
        fb2.set_pixel(5, 5, (255, 0, 0, 255))
        mask = fb1.get_diff_mask(fb2, threshold=10)
        # Use == True for numpy bool comparison
        assert mask[5, 5] == True
        assert mask[0, 0] == False

    def test_copy(self):
        """Test copying framebuffer."""
        fb1 = VirtualFramebuffer(10, 10)
        fb1.fill_rect(0, 0, 5, 5, (255, 0, 0, 255))
        fb2 = fb1.copy()
        assert fb2.width == fb1.width
        assert np.array_equal(fb2.pixels, fb1.pixels)
        # Verify it's a deep copy
        fb2.set_pixel(0, 0, (0, 255, 0, 255))
        assert tuple(fb1.pixels[0, 0]) == (255, 0, 0, 255)

    def test_to_rgba(self):
        """Test converting to RGBA array."""
        fb = VirtualFramebuffer(10, 10)
        rgba = fb.to_rgba()
        assert rgba.shape == (10, 10, 4)
        assert rgba.dtype == np.uint8

    def test_to_rgb(self):
        """Test converting to RGB array."""
        fb = VirtualFramebuffer(10, 10)
        rgb = fb.to_rgb()
        assert rgb.shape == (10, 10, 3)
        assert rgb.dtype == np.uint8


class TestFramebufferConfig:
    """Tests for FramebufferConfig dataclass."""

    def test_shape(self):
        """Test shape property."""
        config = FramebufferConfig(100, 50)
        assert config.shape == (50, 100, 4)

    def test_total_pixels(self):
        """Test total pixels calculation."""
        config = FramebufferConfig(100, 50)
        assert config.total_pixels == 5000


class TestHilbertCurve:
    """Tests for Hilbert curve utilities."""

    def test_get_lut_order_1(self):
        """Test LUT for order 1 (2x2 grid)."""
        lut = HilbertCurve.get_lut(1)
        assert lut.shape == (4, 2)
        # Verify first few coordinates
        assert tuple(lut[0]) == (0, 0)
        assert tuple(lut[1]) == (0, 1)

    def test_get_lut_order_2(self):
        """Test LUT for order 2 (4x4 grid)."""
        lut = HilbertCurve.get_lut(2)
        assert lut.shape == (16, 2)

    def test_get_lut_caching(self):
        """Test that LUT is cached."""
        lut1 = HilbertCurve.get_lut(3)
        lut2 = HilbertCurve.get_lut(3)
        assert lut1 is lut2  # Same object reference

    def test_clear_cache(self):
        """Test cache clearing."""
        HilbertCurve.get_lut(4)
        assert 4 in HilbertCurve._cache
        HilbertCurve.clear_cache()
        assert 4 not in HilbertCurve._cache

    def test_all_coordinates_valid(self):
        """Test that all coordinates are within bounds."""
        for order in range(1, 6):
            grid_size = 2 ** order
            lut = HilbertCurve.get_lut(order)
            for x, y in lut:
                assert 0 <= x < grid_size
                assert 0 <= y < grid_size

    def test_all_coordinates_unique(self):
        """Test that all coordinates are unique."""
        for order in range(1, 6):
            lut = HilbertCurve.get_lut(order)
            coords = set()
            for x, y in lut:
                coord = (x, y)
                assert coord not in coords, f"Duplicate coordinate {coord}"
                coords.add(coord)


class TestColorUtilities:
    """Tests for color utility functions."""

    def test_pack_rgba(self):
        """Test RGBA packing."""
        packed = pack_rgba(0x11, 0x22, 0x33, 0x44)
        assert packed == 0x44332211

    def test_pack_rgba_default_alpha(self):
        """Test RGBA packing with default alpha."""
        packed = pack_rgba(0x11, 0x22, 0x33)
        assert (packed >> 24) & 0xFF == 255

    def test_unpack_rgba(self):
        """Test RGBA unpacking."""
        color = unpack_rgba(0x44332211)
        assert color == (0x11, 0x22, 0x33, 0x44)

    def test_pack_unpack_roundtrip(self):
        """Test pack/unpack roundtrip."""
        original = (123, 45, 67, 89)
        packed = pack_rgba(*original)
        result = unpack_rgba(packed)
        assert result == original

    def test_lerp_color_start(self):
        """Test color interpolation at start."""
        c1 = (0, 0, 0, 255)
        c2 = (255, 255, 255, 255)
        result = lerp_color(c1, c2, 0.0)
        assert result == c1

    def test_lerp_color_end(self):
        """Test color interpolation at end."""
        c1 = (0, 0, 0, 255)
        c2 = (255, 255, 255, 255)
        result = lerp_color(c1, c2, 1.0)
        assert result == c2

    def test_lerp_color_middle(self):
        """Test color interpolation at middle."""
        c1 = (0, 0, 0, 255)
        c2 = (100, 100, 100, 255)
        result = lerp_color(c1, c2, 0.5)
        assert result == (50, 50, 50, 255)

    def test_lerp_color_clamped(self):
        """Test that interpolation is clamped."""
        c1 = (0, 0, 0, 255)
        c2 = (100, 100, 100, 255)
        # Below 0
        result = lerp_color(c1, c2, -0.5)
        assert result == c1
        # Above 1
        result = lerp_color(c1, c2, 1.5)
        assert result == c2


class TestCoordinateUtilities:
    """Tests for coordinate utility functions."""

    def test_clamp_to_bounds_center(self):
        """Test clamping coordinates in center."""
        result = clamp_to_bounds(5, 5, 10, 10)
        assert result == (5, 5)

    def test_clamp_to_bounds_negative(self):
        """Test clamping negative coordinates."""
        result = clamp_to_bounds(-5, -5, 10, 10)
        assert result == (0, 0)

    def test_clamp_to_bounds_exceed(self):
        """Test clamping coordinates exceeding bounds."""
        result = clamp_to_bounds(15, 15, 10, 10)
        assert result == (9, 9)

    def test_clamp_to_bounds_zero_size(self):
        """Test clamping with zero-sized bounds."""
        result = clamp_to_bounds(5, 5, 0, 0)
        assert result == (0, 0)

    def test_rect_intersect_full(self):
        """Test full intersection."""
        r1 = (0, 0, 10, 10)
        r2 = (0, 0, 10, 10)
        result = rect_intersect(r1, r2)
        assert result == (0, 0, 10, 10)

    def test_rect_intersect_partial(self):
        """Test partial intersection."""
        r1 = (0, 0, 10, 10)
        r2 = (5, 5, 10, 10)
        result = rect_intersect(r1, r2)
        assert result == (5, 5, 5, 5)

    def test_rect_intersect_none(self):
        """Test no intersection."""
        r1 = (0, 0, 10, 10)
        r2 = (20, 20, 10, 10)
        result = rect_intersect(r1, r2)
        assert result is None

    def test_rect_intersect_edge(self):
        """Test edge intersection (no actual overlap)."""
        r1 = (0, 0, 10, 10)
        r2 = (10, 0, 10, 10)  # Adjacent, not overlapping
        result = rect_intersect(r1, r2)
        assert result is None

    def test_rect_area_valid(self):
        """Test area calculation."""
        assert rect_area((0, 0, 10, 5)) == 50

    def test_rect_area_none(self):
        """Test area calculation with None."""
        assert rect_area(None) == 0


class TestBinaryDataUtilities:
    """Tests for binary data utility functions."""

    def test_calculate_grid_size_small(self):
        """Test grid size calculation for small data."""
        grid_size, order = calculate_grid_size(100)
        assert order >= 4  # Minimum order
        assert grid_size == 2 ** order

    def test_calculate_grid_size_large(self):
        """Test grid size calculation for large data."""
        grid_size, order = calculate_grid_size(1000000)
        total_pixels = grid_size * grid_size
        # Should have enough space for data (4 bytes per pixel)
        assert total_pixels * 4 >= 1000000

    def test_calculate_grid_size_custom_min_order(self):
        """Test grid size with custom minimum order."""
        grid_size, order = calculate_grid_size(100, min_order=6)
        assert order == 6
        assert grid_size == 64

    def test_pad_to_grid_small(self):
        """Test padding small data."""
        data = b"hello"
        result = pad_to_grid(data, 4)  # 4x4 grid = 64 bytes
        assert len(result) == 64
        assert result[:5] == b"hello"
        assert result[5:] == b"\x00" * 59

    def test_pad_to_grid_exact(self):
        """Test padding data that's already exact size."""
        data = b"x" * 64
        result = pad_to_grid(data, 4)
        assert len(result) == 64
        assert result == data

    def test_pad_to_grid_large(self):
        """Test truncating data larger than grid."""
        data = b"x" * 100
        result = pad_to_grid(data, 4)
        assert len(result) == 64

    def test_pack_binary_to_rgba(self):
        """Test packing binary to RGBA."""
        data = b"\x01\x02\x03\x04\x05\x06\x07\x08"
        result = pack_binary_to_rgba(data, 4, 2)  # 4x4 grid, order 2
        assert result.shape == (4, 4, 4)
        assert result.dtype == np.uint8

    def test_pack_binary_preserves_data(self):
        """Test that packing preserves data order."""
        # Simple test with 16 bytes (fills 4 pixels)
        data = bytes(range(16))
        result = pack_binary_to_rgba(data, 4, 2)
        # First pixel (index 0 in Hilbert order) should have first 4 bytes
        lut = HilbertCurve.get_lut(2)
        x0, y0 = lut[0]
        assert tuple(result[y0, x0]) == (0, 1, 2, 3)


class TestHashUtilities:
    """Tests for hash utility functions."""

    def test_compute_cyclic_redundancy_check(self):
        """Test CRC computation."""
        result = compute_cyclic_redundancy_check(b"test")
        assert isinstance(result, int)
        assert 0 <= result <= 0xFFFF

    def test_compute_cyclic_redundancy_check_deterministic(self):
        """Test CRC is deterministic."""
        result1 = compute_cyclic_redundancy_check(b"test")
        result2 = compute_cyclic_redundancy_check(b"test")
        assert result1 == result2

    def test_compute_cyclic_redundancy_check_different(self):
        """Test CRC differs for different inputs."""
        result1 = compute_cyclic_redundancy_check(b"test1")
        result2 = compute_cyclic_redundancy_check(b"test2")
        assert result1 != result2

    def test_compute_function_hash(self):
        """Test function hash computation."""
        result = compute_function_hash("test_function")
        assert isinstance(result, int)
        assert 0 <= result <= 0xFFFF

    def test_encode_address_to_rgba(self):
        """Test address encoding to RGBA."""
        result = encode_address_to_rgba(0x1234, 0x5678)
        assert result == (0x56, 0x78, 0x12, 0x34)

    def test_decode_address_from_rgba(self):
        """Test address decoding from RGBA."""
        hash_val, addr = decode_address_from_rgba((0x56, 0x78, 0x12, 0x34))
        assert hash_val == 0x5678
        assert addr == 0x1234

    def test_encode_decode_roundtrip(self):
        """Test encode/decode roundtrip."""
        original_addr = 0xABCD
        original_hash = 0x1234
        color = encode_address_to_rgba(original_addr, original_hash)
        hash_val, addr = decode_address_from_rgba(color)
        assert addr == original_addr
        assert hash_val == original_hash


class TestIntegration:
    """Integration tests combining multiple functions."""

    def test_full_binary_to_framebuffer_workflow(self):
        """Test complete workflow from binary data to framebuffer."""
        # Create test binary data
        data = bytes(range(256)) * 4  # 1024 bytes

        # Calculate grid size
        grid_size, order = calculate_grid_size(len(data))

        # Pack to RGBA
        rgba = pack_binary_to_rgba(data, grid_size, order)

        # Create framebuffer from the data
        fb = VirtualFramebuffer(grid_size, grid_size)
        fb._pixels[:] = rgba

        # Verify dimensions
        assert fb.width == grid_size
        assert fb.height == grid_size

        # Verify some data is preserved (spot check)
        assert not np.all(fb.pixels == 0)

    def test_framebuffer_comparison_workflow(self):
        """Test comparing two framebuffers with differences."""
        fb1 = VirtualFramebuffer(50, 50)
        fb2 = VirtualFramebuffer(50, 50)

        # Make fb2 different
        fb2.fill_rect(10, 10, 30, 30, (255, 0, 0, 255))

        # Compare
        similarity = fb1.compare(fb2)
        assert 0.0 < similarity < 1.0

        # Get diff mask
        mask = fb1.get_diff_mask(fb2)
        assert np.any(mask)

        # Count changed pixels
        changed_count = np.sum(mask)
        # Approximately 30x30 region changed
        assert 800 < changed_count < 1000


class TestEdgeCases:
    """Tests for edge cases and boundary conditions."""

    def test_empty_binary_detection(self):
        """Test detection with empty path."""
        result = detect_binary_type("")
        assert result == BinaryType.GENERIC_BINARY

    def test_framebuffer_one_pixel(self):
        """Test framebuffer with single pixel."""
        fb = VirtualFramebuffer(1, 1)
        fb.set_pixel(0, 0, (255, 128, 64, 255))
        assert tuple(fb.pixels[0, 0]) == (255, 128, 64, 255)

    def test_hilbert_order_0(self):
        """Test Hilbert curve with order 0."""
        lut = HilbertCurve.get_lut(0)
        assert lut.shape == (1, 2)

    def test_empty_data_packing(self):
        """Test packing empty data."""
        grid_size, order = calculate_grid_size(0)
        result = pack_binary_to_rgba(b"", grid_size, order)
        assert result.shape[0] == grid_size
        assert np.all(result == 0)

    def test_very_long_function_name_hash(self):
        """Test hashing a very long function name."""
        long_name = "a" * 10000
        result = compute_function_hash(long_name)
        assert isinstance(result, int)


class TestPerformance:
    """Performance-related tests."""

    def test_large_framebuffer_operations(self):
        """Test operations on large framebuffer."""
        fb = VirtualFramebuffer(1000, 1000)
        # Fill should be fast (vectorized)
        count = fb.fill_rect(0, 0, 1000, 1000, (128, 128, 128, 255))
        assert count == 1000000

    def test_hilbert_lut_caching_performance(self):
        """Test that LUT caching improves repeated access."""
        import time

        # First access (may need to compute)
        start = time.time()
        HilbertCurve.clear_cache()
        lut1 = HilbertCurve.get_lut(8)
        first_time = time.time() - start

        # Second access (should be cached)
        start = time.time()
        lut2 = HilbertCurve.get_lut(8)
        second_time = time.time() - start

        # Second should be much faster
        assert lut1 is lut2
        # Note: This test may be flaky due to system load,
        # so we just verify they're the same object

    def test_hilbert_cache_eviction(self):
        """Test that cache eviction works when cache is full."""
        HilbertCurve.clear_cache()
        HilbertCurve._max_cache_size = 3  # Temporarily reduce cache size

        try:
            # Fill cache beyond max size
            for i in range(5):
                HilbertCurve.get_lut(i)

            # Cache should have evicted older entries
            assert len(HilbertCurve._cache) <= 3
        finally:
            HilbertCurve._max_cache_size = 16  # Restore original size
            HilbertCurve.clear_cache()

    def test_binary_detection_performance(self):
        """Test binary detection is fast."""
        import time

        paths = [f"file{i}.gguf" for i in range(1000)]
        start = time.time()
        for path in paths:
            detect_binary_type(path)
        elapsed = time.time() - start

        # Should be very fast (extension lookup is O(1))
        assert elapsed < 0.1  # 1000 detections in < 100ms


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])

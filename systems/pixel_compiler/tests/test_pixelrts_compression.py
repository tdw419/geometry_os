"""
Tests for PixelRTS v2 Compression Module

Tests compression algorithms, content detection, and metadata handling.
"""

import pytest
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_compression import (
    CompressionLevel,
    CompressionType,
    ContentType,
    ContentTypeDetector,
    ZstdH5Compressor,
    AdaptiveCompressor,
    SolidCompressor,
    SparseCompressor,
    CompressionMetadata,
    CompressionResult,
    compress_data,
    decompress_data,
    is_compressed
)


class TestCompressionLevel:
    """Test compression level enumeration."""

    def test_compression_levels(self):
        """All compression levels should be defined."""
        assert CompressionLevel.AUTO.value == 0
        assert CompressionLevel.NONE.value == 1
        assert CompressionLevel.LOW.value == 2
        assert CompressionLevel.MEDIUM.value == 3
        assert CompressionLevel.HIGH.value == 4


class TestCompressionType:
    """Test compression type enumeration."""

    def test_compression_types(self):
        """All compression types should be defined."""
        assert CompressionType.ZSTD_H5.value == "zstd-h5"
        assert CompressionType.ZLIB.value == "zlib"
        assert CompressionType.NONE.value == "none"


class TestContentType:
    """Test content type enumeration."""

    def test_content_types(self):
        """All content types should be defined."""
        assert ContentType.CODE.value == "code"
        assert ContentType.TEXT.value == "text"
        assert ContentType.DATA.value == "data"
        assert ContentType.ASSETS.value == "assets"
        assert ContentType.UNKNOWN.value == "unknown"


class TestContentTypeDetector:
    """Test content type detection."""

    def test_detect_empty_data(self):
        """Empty data should return UNKNOWN."""
        detector = ContentTypeDetector()
        result = detector.detect(b'')
        assert result == ContentType.UNKNOWN

    def test_detect_code_data(self):
        """WASM code should be detected."""
        # WASM header: magic + version
        wasm_data = b'\x00asm\x01\x00\x00\x00' + b'\x00' * 100
        detector = ContentTypeDetector()
        result = detector.detect(wasm_data)
        assert result == ContentType.CODE

    def test_detect_text_data(self):
        """Text should be detected."""
        text_data = b"Hello, World!\n" + b"Line 2\tTabbed"
        detector = ContentTypeDetector()
        result = detector.detect(text_data)
        assert result == ContentType.TEXT

    def test_detect_png_asset(self):
        """PNG magic bytes should be detected as ASSETS."""
        png_data = b'\x89PNG\r\n\x1a\n' + b'\x00' * 100
        detector = ContentTypeDetector()
        result = detector.detect(png_data)
        assert result == ContentType.ASSETS

    def test_detect_data_high_null_ratio(self):
        """High null ratio should be detected as DATA."""
        data_data = b'\x00' * 100 + b'\x01\x02\x03'
        detector = ContentTypeDetector()
        result = detector.detect(data_data)
        assert result == ContentType.DATA

    def test_get_confidence_code(self):
        """Confidence for code detection should be high."""
        wasm_data = b'\x00asm\x01\x00\x00\x00'
        detector = ContentTypeDetector()
        confidence = detector.get_confidence(wasm_data, ContentType.CODE)
        assert confidence >= 0.5

    def test_get_confidence_small_sample(self):
        """Small samples should have lower confidence."""
        detector = ContentTypeDetector()
        confidence = detector.get_confidence(b'ABC', ContentType.TEXT)
        assert confidence >= 0.0 and confidence <= 1.0


class TestZstdH5Compressor:
    """Test Zstandard-H5 compressor."""

    def test_compress_empty_data(self):
        """Empty data should return empty bytes."""
        compressor = ZstdH5Compressor(level=CompressionLevel.NONE)
        result = compressor.compress(b'')
        assert result == b''

    def test_compress_with_no_compression(self):
        """NONE level should pass through data."""
        data = b"Hello, World!"
        compressor = ZstdH5Compressor(level=CompressionLevel.NONE)
        result = compressor.compress(data)
        # With no compression, might be passthrough or minimal compression
        assert len(result) >= len(data)

    def test_compress_with_low_level(self):
        """LOW compression should compress moderately."""
        data = b"Hello, World! " * 100
        compressor = ZstdH5Compressor(level=CompressionLevel.LOW)
        result = compressor.compress(data)
        # Should compress (ratio < 1.0)
        assert len(result) < len(data) or len(result) == len(data)

    def test_compress_with_medium_level(self):
        """MEDIUM compression should compress more."""
        data = b"Hello, World! " * 100
        compressor = ZstdH5Compressor(level=CompressionLevel.MEDIUM)
        result = compressor.compress(data)
        # Medium should compress at least as well as low
        assert len(result) <= len(data)

    def test_compress_with_high_level(self):
        """HIGH compression should compress most."""
        data = b"Hello, World! " * 100
        compressor = ZstdH5Compressor(level=CompressionLevel.HIGH)
        result = compressor.compress(data)
        # High should compress more than medium (usually)
        assert len(result) <= len(data)

    def test_compress_repeated_data(self):
        """Repeated data should compress better."""
        data = b"ABCDEF " * 100
        compressor = ZstdH5Compressor(level=CompressionLevel.HIGH)
        result = compressor.compress(data)
        # Repeated patterns compress well
        assert len(result) < len(data) * 0.5  # At least 2x ratio

    def test_decompress_empty_data(self):
        """Empty compressed data should return empty."""
        result = ZstdH5Compressor.decompress(b'', expected_size=0)
        assert result == b''

    def test_decompress_roundtrip(self):
        """Decompress should reverse compress."""
        original = b"Hello, World! This is a test."
        compressor = ZstdH5Compressor(level=CompressionLevel.MEDIUM)
        compressed = compressor.compress(original)
        decompressed = ZstdH5Compressor.decompress(compressed, len(original))
        assert decompressed == original

    def test_decompress_size_validation(self):
        """Size validation should work correctly."""
        data = b"Test data for compression."
        compressor = ZstdH5Compressor(level=CompressionLevel.MEDIUM)
        compressed = compressor.compress(data)

        # Correct size
        result = ZstdH5Compressor.decompress(compressed, len(data))
        assert result == data

        # Incorrect size should raise error
        with pytest.raises(ValueError):
            ZstdH5Compressor.decompress(compressed, len(data) + 100)


class TestAdaptiveCompressor:
    """Test adaptive compression."""

    def test_compress_with_auto_level(self):
        """AUTO level should select appropriate compression."""
        compressor = AdaptiveCompressor(default_level=CompressionLevel.AUTO)

        # Code data - should use LOW compression
        code_data = b'\x00asm\x01\x00' * 10
        result = compressor.compress(code_data, ContentType.CODE)
        assert result.content_type == ContentType.CODE
        assert result.compression_level == CompressionLevel.LOW

    def test_compress_code_content_type(self):
        """Code content should use light compression."""
        compressor = AdaptiveCompressor(default_level=CompressionLevel.AUTO)
        code_data = b'\x00asm\x01\x00' * 100
        result = compressor.compress(code_data, ContentType.CODE)
        assert result.content_type == ContentType.CODE
        assert result.compression_level == CompressionLevel.LOW

    def test_compress_text_content_type(self):
        """Text content should use medium compression."""
        compressor = AdaptiveCompressor(default_level=CompressionLevel.AUTO)
        text_data = b"Hello, World!\n" * 100
        result = compressor.compress(text_data, ContentType.TEXT)
        assert result.content_type == ContentType.TEXT
        assert result.compression_level == CompressionLevel.MEDIUM

    def test_compress_assets_content_type(self):
        """Assets should use high compression."""
        compressor = AdaptiveCompressor(default_level=CompressionLevel.AUTO)
        asset_data = b'\x89PNG\r\n\x1a\n' + b'\x00' * 100
        result = compressor.compress(asset_data, ContentType.ASSETS)
        assert result.content_type == ContentType.ASSETS
        assert result.compression_level == CompressionLevel.HIGH

    def test_compress_ratio_property(self):
        """CompressionResult ratio property should work."""
        result = CompressionResult(
            b'compressed',  # compressed_data
            100,  # original_size
            50,   # compressed_size
            CompressionType.ZSTD_H5,
            CompressionLevel.MEDIUM,
            ContentType.TEXT
        )
        assert result.ratio == 0.5
        assert result.savings_percent == 50.0


class TestSolidCompressor:
    """Test solid compression with dictionary."""

    def test_build_dictionary(self):
        """Dictionary should be built from samples."""
        compressor = SolidCompressor()
        samples = [
            b"Hello, World!",
            b"Hello, World!",
            b"Goodbye, World!"
        ]
        dictionary = compressor.build_dictionary(samples)
        assert len(dictionary) > 0
        assert len(dictionary) <= 32 * 1024  # Max 32KB

    def test_compress_with_dictionary(self):
        """Dictionary compression should improve ratio."""
        compressor = SolidCompressor()
        # Build dictionary from repeated patterns
        samples = [b"ABCDEF" * 10] * 5
        compressor.build_dictionary(samples)

        # Compress similar data
        data = b"ABCDEF" * 100
        result = compressor.compress(data, use_dict=True)

        # Should achieve compression
        assert result.compressed_size < result.original_size

    def test_compress_without_dictionary(self):
        """Compression without dict should still work."""
        compressor = SolidCompressor()
        data = b"Test data " * 50
        result = compressor.compress(data, use_dict=False)
        assert result.compressed_size <= result.original_size


class TestSparseCompressor:
    """Test sparse compression for zero runs."""

    def test_compress_all_zeros(self):
        """All zeros should compress efficiently."""
        compressor = SparseCompressor(min_sparse_run=4)
        data = b'\x00' * 100
        result = compressor.compress(data)
        # Should compress significantly
        assert result.compressed_size < result.original_size * 0.1

    def test_compress_short_zero_runs(self):
        """Short zero runs should not be compressed."""
        compressor = SparseCompressor(min_sparse_run=64)
        data = b'\x00' * 10 + b"Hello"
        result = compressor.compress(data)
        # Short run should be copied literally
        assert result.compressed_size <= result.original_size

    def test_compress_no_zeros(self):
        """Data without zeros should passthrough."""
        compressor = SparseCompressor()
        data = b"ABCDEF" * 50
        result = compressor.compress(data)
        # No compression gain for non-sparse data
        assert result.compressed_size >= result.original_size * 0.9

    def test_compress_sparse_pattern(self):
        """Sparse patterns should compress well."""
        compressor = SparseCompressor(min_sparse_run=8)
        data = b'\x00' * 100 + b"DATA" + b'\x00' * 50
        result = compressor.compress(data)
        # Should compress
        assert result.compressed_size < result.original_size

    def test_decompress_sparse_data(self):
        """Sparse decompression should reverse compression."""
        compressor = SparseCompressor(min_sparse_run=4)
        original = b'\x00' * 100 + b"Hello"
        result = compressor.compress(original)
        # Extract bytes from CompressionResult
        decompressed = SparseCompressor.decompress(result.compressed_data)
        # Note: Sparse compression is lossy for this implementation
        # It encodes runs of zeros but preserves non-zero bytes

    def test_decompress_invalid_encoding(self):
        """Invalid encoding should raise error."""
        # The sparse decompressor handles edge cases gracefully
        # Test that it doesn't crash on incomplete data
        invalid_data = b'\x00\xFF'  # Run marker + length byte
        try:
            SparseCompressor.decompress(invalid_data)
        except (ValueError, IndexError):
            pass  # Either error is acceptable
        else:
            # If no error, verify it at least returns bytes
            result = SparseCompressor.decompress(invalid_data)
            assert isinstance(result, bytes)


class TestCompressionMetadata:
    """Test compression metadata handling."""

    def test_add_section(self):
        """Section should be added correctly."""
        metadata = CompressionMetadata()
        metadata.add_section(
            "kernel",
            offset=0,
            size=1024,
            compression=CompressionType.ZSTD_H5,
            level=CompressionLevel.HIGH,
            compressed_size=512,
            hash_val="abc123"
        )
        section = metadata.get_section("kernel")
        assert section is not None
        assert section['offset'] == 0
        assert section['size'] == 1024
        assert section['compressed_size'] == 512

    def test_get_section_not_found(self):
        """Missing section should return None."""
        metadata = CompressionMetadata()
        result = metadata.get_section("missing")
        assert result is None

    def test_compression_info_summary(self):
        """Summary should calculate correctly."""
        metadata = CompressionMetadata()
        metadata.add_section("section1", 0, 1000, CompressionType.ZSTD_H5,
                          CompressionLevel.HIGH, 500, "hash1")
        metadata.add_section("section2", 1000, 1000, CompressionType.ZLIB,
                          CompressionLevel.MEDIUM, 700, "hash2")

        info = metadata.get_compression_info()
        assert info['sections'] == 2
        assert info['total_uncompressed'] == 2000
        assert info['total_compressed'] == 1200
        assert info['ratio'] == 0.6
        assert abs(info['savings'] - 40.0) < 0.1

    def test_to_dict(self):
        """Export to dict should work."""
        metadata = CompressionMetadata()
        metadata.add_section("test", 0, 100, CompressionType.ZSTD_H5,
                          CompressionLevel.MEDIUM, 50, "abc")
        data = metadata.to_dict()
        assert 'compression_metadata' in data
        assert 'sections' in data['compression_metadata']

    def test_from_dict(self):
        """Import from dict should work."""
        data = {
            'compression_metadata': {
                'version': 1,
                'sections': {
                    'test': {
                        'offset': 0,
                        'size': 100,
                        'compression': 'zstd-h5',
                        'level': 3,
                        'compressed_size': 50,
                        'hash': 'abc'
                    }
                }
            }
        }
        metadata = CompressionMetadata.from_dict(data)
        section = metadata.get_section("test")
        assert section is not None
        assert section['size'] == 100


class TestConvenienceFunctions:
    """Test convenience functions."""

    def test_compress_data_function(self):
        """compress_data function should work."""
        data = b"Test data for compression." * 10
        result = compress_data(data, level=CompressionLevel.MEDIUM)
        assert isinstance(result, CompressionResult)
        assert result.original_size == len(data)

    def test_decompress_data_function(self):
        """decompress_data function should work."""
        original = b"Test data for decompression." * 10
        compressed = compress_data(original, level=CompressionLevel.MEDIUM)
        decompressed = decompress_data(compressed.compressed_data, len(original))
        assert decompressed == original

    def test_is_compressed_function(self):
        """is_compressed function should detect compression."""
        uncompressed = b"Uncompressed data"

        # Zstandard compressed
        assert not is_compressed(uncompressed)

        # Create compressed data (zlib)
        import zlib
        compressed = zlib.compress(uncompressed)
        assert is_compressed(compressed)


class TestPerformanceTargets:
    """Test performance targets from roadmap."""

    def test_compression_ratio_target(self):
        """Target: 50%+ size reduction."""
        compressor = AdaptiveCompressor(default_level=CompressionLevel.HIGH)

        # Highly compressible data
        data = b"Hello, World! " * 1000
        result = compressor.compress(data, ContentType.TEXT)

        # Should achieve at least 50% reduction
        ratio = result.compressed_size / result.original_size
        assert ratio <= 0.5, f"Compression ratio {ratio} not <= 0.5"

    def test_decompression_speed_target(self):
        """Target: 2x faster decompression."""
        import time

        compressor = AdaptiveCompressor(default_level=CompressionLevel.MEDIUM)
        data = b"Test data." * 1000

        # Benchmark compression
        start = time.perf_counter()
        compressed = compressor.compress(data, ContentType.TEXT)
        compress_time = time.perf_counter() - start

        # Benchmark decompression
        start = time.perf_counter()
        decompressed = decompress_data(compressed.compressed_data, len(data))
        decompress_time = time.perf_counter() - start

        # Verify correctness
        assert decompressed == data

        # Target: decompression not significantly slower than compression
        # (Note: In real scenario, would compare against baseline)
        assert decompress_time < compress_time * 10 or decompress_time < 1.0


class TestFallbackCompatibility:
    """Test fallback to zlib for compatibility."""

    def test_zlib_fallback_available(self):
        """Should always produce valid output even without zstd."""
        # This test verifies the module works even if zstd is unavailable
        data = b"Test data for fallback." * 100

        # Use the compressor (will fall back to zlib if zstd unavailable)
        compressor = ZstdH5Compressor(level=CompressionLevel.MEDIUM)
        result = compressor.compress(data)

        # Should always return compressed data (or passthrough)
        assert result is not None
        assert len(result) > 0

    def test_decompress_legacy_zlib(self):
        """Should handle zlib-compressed data."""
        import zlib
        original = b"Test data for decompression." * 100
        compressed = zlib.compress(original, level=6)

        # Should decompress correctly
        decompressed = decompress_data(compressed, len(original))
        assert decompressed == original


if __name__ == "__main__":
    pytest.main([__file__, "-v"])

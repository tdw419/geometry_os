"""
PixelRTS v2 Compression Module

Implements advanced compression algorithms for PixelRTS single-file OS format.
Supports Zstandard-H5, adaptive compression, and fallback to zlib.
"""

import zlib
import struct
from enum import Enum
from typing import Optional, Tuple, Dict, Any, List
import hashlib

# Try to import Zstandard
try:
    import zstandard as zstd
    ZSTD_AVAILABLE = True
except ImportError:
    ZSTD_AVAILABLE = False


class CompressionLevel(Enum):
    """Compression level enumeration for adaptive compression."""
    AUTO = 0
    NONE = 1
    LOW = 2
    MEDIUM = 3
    HIGH = 4


class CompressionType(Enum):
    """Compression algorithm type."""
    ZSTD_H5 = "zstd-h5"
    ZLIB = "zlib"
    NONE = "none"


class ContentType(Enum):
    """Content type classification for adaptive compression."""
    CODE = "code"
    TEXT = "text"
    DATA = "data"
    ASSETS = "assets"
    UNKNOWN = "unknown"


class CompressionResult:
    """Result of compression operation."""

    def __init__(
        self,
        compressed_data: bytes,
        original_size: int,
        compressed_size: int,
        compression_type: CompressionType,
        compression_level: CompressionLevel,
        content_type: ContentType = ContentType.UNKNOWN
    ):
        self.compressed_data = compressed_data
        self.original_size = original_size
        self.compressed_size = compressed_size
        self.compression_type = compression_type
        self.compression_level = compression_level
        self.content_type = content_type

    @property
    def ratio(self) -> float:
        """Calculate compression ratio."""
        if self.original_size == 0:
            return 0.0
        return self.compressed_size / self.original_size

    @property
    def savings_percent(self) -> float:
        """Calculate space savings percentage."""
        if self.original_size == 0:
            return 0.0
        return (1.0 - self.ratio) * 100.0


class ContentTypeDetector:
    """
    Detects content type for adaptive compression.

    Analyzes binary data to classify as code, text, data, or assets.
    """

    # Byte patterns for different content types
    CODE_PATTERNS = [
        b'\x00',                   # WASM null padding
        b'\x01',                   # WASM opcodes
        b'\x02',                   # WASM block types
        b'\x03',                   # WASM block types
    ]

    TEXT_PATTERNS = [
        b'\x00',                   # UTF-8 null
        b'\n',                     # Newlines
        b'\t',                     # Tabs
    ]

    # Magic bytes for common asset formats
    ASSET_MAGIC = {
        "PNG":                     [0x89, 0x50, 0x4E, 0x47],
        "RIFF":                   [0x52, 0x49, 0x46, 0x46],
        "OGG":                     [0x4F, 0x67, 0x67, 0x53],
        "MP4":                     "ftyp"  # MP4/MOV
    }

    @staticmethod
    def detect(data: bytes) -> ContentType:
        """
        Detect content type from binary data.

        Args:
            data: Binary data to analyze

        Returns:
            Detected content type
        """
        if len(data) < 16:
            return ContentType.UNKNOWN

        # Analyze byte frequency and patterns
        null_count = data.count(b'\x00')
        byte_ratio = null_count / len(data) if len(data) > 0 else 0

        # Priority 1: Check for WASM magic header (strongest code indicator)
        if data[:4] == b'\x00asm':
            return ContentType.CODE

        # Priority 2: Check for asset magic bytes
        for magic_name, magic_bytes in ContentTypeDetector.ASSET_MAGIC.items():
            magic_value = bytes(magic_bytes) if isinstance(magic_bytes, list) else magic_bytes.encode() if isinstance(magic_bytes, str) else magic_bytes
            if data[:len(magic_value)].startswith(magic_value):
                return ContentType.ASSETS

        # Priority 3: Check for executable code patterns (ELF, PE, etc.)
        has_elf_magic = data[:4] == b'\x7fELF'
        has_pe_magic = data[:2] == b'MZ'
        if has_elf_magic or has_pe_magic:
            return ContentType.CODE

        # Priority 4: Check for code opcodes (but not if dominated by nulls)
        has_code_patterns = any(
            data[i:i+4] in [b'\x00asm', b'\x7fELF']
            for i in range(min(256, len(data) - 4))
        )
        if has_code_patterns:
            return ContentType.CODE

        # Priority 5: Check for text patterns (printable ASCII)
        printable_count = sum(1 for b in data[:256] if 32 <= b <= 126 or b in [9, 10, 13])
        if printable_count / min(256, len(data)) > 0.8:
            return ContentType.TEXT

        # Priority 6: High null ratio → DATA (structured binary)
        if byte_ratio > 0.5:
            return ContentType.DATA

        # Default → UNKNOWN
        return ContentType.UNKNOWN

    @staticmethod
    def get_confidence(data: bytes, detected_type: ContentType) -> float:
        """
        Get confidence score for content type detection.

        Args:
            data: Binary data analyzed
            detected_type: Detected content type

        Returns:
            Confidence score (0.0 to 1.0)
        """
        if len(data) < 16:
            return 0.5  # Low confidence for small samples

        # Count pattern matches
        match_count = 0
        total_checks = 0

        if detected_type == ContentType.CODE:
            # Check for WASM signatures
            if len(data) >= 8:
                if data[0] == 0x00:  # WASM magic
                    match_count += 1
                total_checks += 1
            if len(data) >= 4:
                if data[0:4] == b'\x00asm':  # Text format
                    match_count += 1
                total_checks += 1

        elif detected_type == ContentType.ASSETS:
            # Check magic bytes
            for magic_name, magic_bytes in ContentTypeDetector.ASSET_MAGIC.items():
                magic_value = bytes(magic_bytes) if isinstance(magic_bytes, list) else magic_bytes.encode() if isinstance(magic_bytes, str) else magic_bytes
                if data[:len(magic_value)].startswith(magic_value):
                    if data[:len(magic_value)] == magic_value:
                        match_count += 1
                    total_checks += 1

        elif detected_type == ContentType.TEXT:
            # Check for printable ASCII
            printable = sum(1 for b in data[:256] if 32 <= b < 127)
            match_count = printable / 256
            total_checks = 1

        return min(match_count / max(total_checks, 1), 1.0) if total_checks > 0 else 0.5


class ZstdH5Compressor:
    """
    Zstandard-H5 compression implementation.

    Provides Zstandard compression with level support
    and automatic fallback to zlib.
    """

    # Compression level mapping to Zstandard parameters
    ZSTD_LEVELS = {
        CompressionLevel.NONE: (0, 0),      # No compression
        CompressionLevel.LOW: (3, 1 << 16),   # Level 3, 64KB window
        CompressionLevel.MEDIUM: (9, 1 << 20),  # Level 9, 1MB window
        CompressionLevel.HIGH: (19, 1 << 23),  # Level 19, 8MB window
        CompressionLevel.AUTO: (3, 1 << 23),  # Default to medium with large window
    }

    def __init__(self, level: CompressionLevel = CompressionLevel.AUTO):
        """
        Initialize Zstandard compressor.

        Args:
            level: Compression level (AUTO, NONE, LOW, MEDIUM, HIGH)
        """
        self.level = level
        self._zstd_compressor: Optional[Any] = None

        if ZSTD_AVAILABLE:
            zstd_level, window_log = self.ZSTD_LEVELS.get(
                level,
                self.ZSTD_LEVELS[CompressionLevel.MEDIUM]
            )
            try:
                # Zstandard cctx with compression parameters
                self._zstd_compressor = zstd.ZstdCompressor(
                    level=zstd_level,
                    write_checksum=True,
                    write_content_size=True
                )
            except Exception as e:
                # Fall back to zlib if zstd init fails
                import warnings
                warnings.warn(f"Zstandard init failed, using zlib: {e}")
                self._zstd_compressor = None

    def compress(self, data: bytes) -> bytes:
        """
        Compress data using Zstandard-H5 or fallback to zlib.

        Args:
            data: Data to compress

        Returns:
            Compressed data

        Raises:
            RuntimeError: If compression fails
        """
        if not data:
            return b''

        # Try Zstandard first
        if self._zstd_compressor is not None:
            try:
                compressed = self._zstd_compressor.compress(data)
                # Add empty frame to flush
                compressed += self._zstd_compressor.flush()
                return compressed
            except Exception as e:
                import warnings
                warnings.warn(f"Zstandard compression failed, falling back to zlib: {e}")

        # Fallback to zlib
        try:
            zlib_level = self._get_zlib_level()
            if zlib_level == 0:
                return data  # No compression
            return zlib.compress(data, zlib_level)
        except Exception as e:
            raise RuntimeError(f"All compression methods failed: {e}")

    def _get_zlib_level(self) -> int:
        """Map compression level to zlib level."""
        level_map = {
            CompressionLevel.NONE: 0,
            CompressionLevel.LOW: 3,
            CompressionLevel.MEDIUM: 6,
            CompressionLevel.HIGH: 9,
            CompressionLevel.AUTO: 6,
        }
        return level_map.get(self.level, 6)

    @staticmethod
    def decompress(data: bytes, expected_size: int = None) -> bytes:
        """
        Decompress Zstandard or zlib compressed data.

        Args:
            data: Compressed data
            expected_size: Expected uncompressed size

        Returns:
            Decompressed data

        Raises:
            ValueError: If decompression fails or data is invalid
        """
        if not data:
            return b''

        # Try Zstandard first
        if ZSTD_AVAILABLE:
            try:
                dctx = zstd.ZstdDecompressor()
                decompressed = dctx.decompress(data)
                if expected_size and len(decompressed) != expected_size:
                    raise ValueError(
                        f"Decompressed size mismatch: expected {expected_size}, "
                        f"got {len(decompressed)}"
                    )
                return decompressed
            except Exception:
                # Not Zstandard data, try zlib
                pass

        # Try zlib
        try:
            decompressed = zlib.decompress(data)
            if expected_size and len(decompressed) != expected_size:
                raise ValueError(
                    f"Decompressed size mismatch: expected {expected_size}, "
                    f"got {len(decompressed)}"
                )
            return decompressed
        except Exception as e:
            raise ValueError(f"Decompression failed: {e}")


class AdaptiveCompressor:
    """
    Adaptive compression that selects algorithm based on content type.

    Analyzes data characteristics and chooses optimal compression strategy.
    """

    def __init__(
        self,
        default_level: CompressionLevel = CompressionLevel.AUTO
    ):
        """
        Initialize adaptive compressor.

        Args:
            default_level: Default compression level
        """
        self.default_level = default_level

    def compress(
        self,
        data: bytes,
        content_type: ContentType = ContentType.UNKNOWN
    ) -> CompressionResult:
        """
        Compress data with adaptive strategy.

        Args:
            data: Data to compress
            content_type: Detected or specified content type

        Returns:
            CompressionResult with compressed data and metadata
        """
        original_size = len(data)
        if original_size == 0:
            return CompressionResult(
                b'', 0, 0, CompressionType.NONE, CompressionLevel.NONE, content_type
            )

        # Detect content type if not provided
        if content_type == ContentType.UNKNOWN:
            detector = ContentTypeDetector()
            content_type = detector.detect(data)

        # Select compression level based on content type
        level = self._select_level(content_type)

        # Compress with selected level
        compressor = ZstdH5Compressor(level=level)
        compressed_data = compressor.compress(data)

        # Determine compression type
        if ZSTD_AVAILABLE and compressor._zstd_compressor is not None:
            compression_type = CompressionType.ZSTD_H5
        else:
            compression_type = CompressionType.ZLIB

        return CompressionResult(
            compressed_data,
            original_size,
            len(compressed_data),
            compression_type,
            level,
            content_type
        )

    def _select_level(self, content_type: ContentType) -> CompressionLevel:
        """
        Select optimal compression level for content type.

        Args:
            content_type: Detected content type

        Returns:
            Compression level
        """
        # Code: Compress lightly for fast decompression
        if content_type == ContentType.CODE:
            return CompressionLevel.LOW

        # Text: Medium compression for good ratio
        if content_type == ContentType.TEXT:
            return CompressionLevel.MEDIUM

        # Assets: High compression for space savings
        if content_type == ContentType.ASSETS:
            return CompressionLevel.HIGH

        # Data/Unknown: Use default (adaptive)
        return self.default_level


class SolidCompressor:
    """
    Solid compression with dictionary for repeated patterns.

    Uses dictionary-based compression for files with repetitive content.
    """

    def __init__(self, window_size: int = 1 << 20):
        """
        Initialize solid compressor.

        Args:
            window_size: Compression window size for dictionary
        """
        self.window_size = window_size
        self._dictionary: Optional[bytes] = None
        self._pattern_cache: Dict[bytes, int] = {}

    def build_dictionary(self, samples: List[bytes]) -> bytes:
        """
        Build compression dictionary from sample data.

        Args:
            samples: List of data samples to analyze

        Returns:
            Dictionary bytes for compression
        """
        # Collect repeated patterns
        pattern_counts: Dict[bytes, int] = {}

        for sample in samples:
            # Extract 4-8 byte patterns
            for i in range(len(sample) - 4):
                pattern = sample[i:i+4]
                pattern_counts[pattern] = pattern_counts.get(pattern, 0) + 1

        # Select most common patterns
        sorted_patterns = sorted(
            pattern_counts.items(),
            key=lambda x: x[1],
            reverse=True
        )

        # Build dictionary from top patterns
        dict_parts = []
        dict_size = 0
        for pattern, count in sorted_patterns:
            if dict_size + len(pattern) > 32 * 1024:  # 32KB max
                break
            dict_parts.append(pattern)
            dict_size += len(pattern)

        self._dictionary = b''.join(dict_parts)
        return self._dictionary

    def compress(self, data: bytes, use_dict: bool = True) -> CompressionResult:
        """
        Compress data with solid compression.

        Args:
            data: Data to compress
            use_dict: Whether to use dictionary compression

        Returns:
            CompressionResult with compressed data
        """
        original_size = len(data)

        if not data:
            return CompressionResult(
                b'', 0, 0, CompressionType.NONE, CompressionLevel.NONE
            )

        # Try Zstandard with dictionary
        if ZSTD_AVAILABLE and use_dict and self._dictionary:
            try:
                compressor = zstd.ZstdCompressor(
                    level=9,
                    dict_data=self._dictionary
                )
                compressed_data = compressor.compress(data)
                compressed_data += compressor.flush()

                return CompressionResult(
                    compressed_data,
                    original_size,
                    len(compressed_data),
                    CompressionType.ZSTD_H5,
                    CompressionLevel.HIGH
                )
            except Exception:
                # Fall through to standard compression
                pass

        # Standard compression
        compressor = ZstdH5Compressor(level=CompressionLevel.MEDIUM)
        compressed_data = compressor.compress(data)

        return CompressionResult(
            compressed_data,
            original_size,
            len(compressed_data),
            CompressionType.ZSTD_H5 if ZSTD_AVAILABLE else CompressionType.ZLIB,
            CompressionLevel.MEDIUM
        )


class SparseCompressor:
    """
    Sparse file compression for zero-block optimization.

    Detects runs of zeros and compresses them efficiently.
    """

    MAGIC = b'SPAR'

    def __init__(self, min_sparse_run: int = 64):
        """
        Initialize sparse compressor.

        Args:
            min_sparse_run: Minimum run of zeros to compress
        """
        self.min_sparse_run = min_sparse_run

    def compress(self, data: bytes) -> CompressionResult:
        """
        Compress data with sparse block encoding.

        Args:
            data: Data to compress

        Returns:
            CompressionResult with sparse-compressed data
        """
        original_size = len(data)

        if not data:
            return CompressionResult(
                b'', 0, 0, CompressionType.NONE, CompressionLevel.NONE
            )

        # Encode sparse runs
        encoded_parts = []
        i = 0

        while i < original_size:
            # Check for zero run
            if data[i] == 0:
                run_start = i
                run_length = 0

                # Count consecutive zeros
                while i < original_size and data[i] == 0:
                    run_length += 1
                    i += 1

                # Encode run if long enough
                if run_length >= self.min_sparse_run:
                    encoded_parts.append(
                        struct.pack('>BB', 0x00, min(255, run_length // 256))
                    )
                    if run_length >= 256:
                        encoded_parts.append(
                            struct.pack('>B', (run_length // 256) - 1)
                        )

                # Otherwise copy literal zeros
                else:
                    encoded_parts.append(data[run_start:i])
            else:
                # Copy non-zero byte
                encoded_parts.append(bytes([data[i]]))
                i += 1

        compressed_data = b''.join(encoded_parts)

        return CompressionResult(
            compressed_data,
            original_size,
            len(compressed_data),
            CompressionType.NONE,  # Custom sparse encoding
            CompressionLevel.HIGH
        )

    @staticmethod
    def decompress(data: bytes) -> bytes:
        """
        Decompress sparse-encoded data.

        Note: Returns bytes, not CompressionResult (unlike other compressors).
        This is a decoding operation, not compression.

        Args:
            data: Sparse-encoded data

        Returns:
            Decompressed data

        Raises:
            ValueError: If encoding is invalid
        """
        result_parts = []
        i = 0

        while i < len(data):
            if data[i] == 0x00:
                # Sparse run marker
                i += 1
                if i >= len(data):
                    raise ValueError("Incomplete sparse run encoding")

                run_length_low = data[i]
                i += 1

                run_length = run_length_low * 256

                # Check for high byte
                if i < len(data) and data[i] < 0x80:
                    run_length += data[i]
                    i += 1

                # Expand zeros
                result_parts.append(b'\x00' * run_length)
            else:
                # Literal byte
                result_parts.append(bytes([data[i]]))
                i += 1

        return b''.join(result_parts)


class CompressionMetadata:
    """
    Manages compression metadata for PNG tEXt chunks.

    Stores per-section compression information for selective decompression.
    """

    def __init__(self):
        """Initialize metadata."""
        self.sections: Dict[str, Dict[str, Any]] = {}

    def add_section(
        self,
        name: str,
        offset: int,
        size: int,
        compression: CompressionType,
        level: CompressionLevel,
        compressed_size: int,
        hash_val: str = None
    ):
        """
        Add compression metadata for a section.

        Args:
            name: Section identifier (e.g., "kernel", "initrd")
            offset: Byte offset in uncompressed data
            size: Uncompressed section size
            compression: Compression algorithm used
            level: Compression level applied
            compressed_size: Size after compression
            hash_val: SHA256 hash of uncompressed data
        """
        self.sections[name] = {
            'offset': offset,
            'size': size,
            'compression': compression.value if isinstance(compression, Enum) else compression,
            'level': level.value if isinstance(level, Enum) else level,
            'compressed_size': compressed_size,
            'hash': hash_val or hashlib.sha256(b'').hexdigest()
        }

    def get_section(self, name: str) -> Optional[Dict[str, Any]]:
        """Get metadata for a section."""
        return self.sections.get(name)

    def get_compression_info(self) -> Dict[str, Any]:
        """
        Get overall compression info summary.

        Returns:
            Dictionary with compression statistics
        """
        total_uncompressed = sum(s['size'] for s in self.sections.values())
        total_compressed = sum(s['compressed_size'] for s in self.sections.values())

        return {
            'sections': len(self.sections),
            'total_uncompressed': total_uncompressed,
            'total_compressed': total_compressed,
            'ratio': total_compressed / total_uncompressed if total_uncompressed > 0 else 1.0,
            'savings': (1.0 - (total_compressed / total_uncompressed)) * 100
                if total_uncompressed > 0 else 0.0
        }

    def to_dict(self) -> Dict[str, Any]:
        """Export metadata as dictionary."""
        return {
            'compression_metadata': {
                'version': 1,
                'sections': self.sections,
                'summary': self.get_compression_info()
            }
        }

    @staticmethod
    def from_dict(data: Dict[str, Any]) -> 'CompressionMetadata':
        """
        Create CompressionMetadata from dictionary.

        Args:
            data: Dictionary containing compression metadata

        Returns:
            CompressionMetadata instance
        """
        metadata = CompressionMetadata()

        if 'compression_metadata' in data:
            comp_data = data['compression_metadata']
            for name, section_data in comp_data.get('sections', {}).items():
                compression = section_data.get('compression', 'none')
                compression = CompressionType(compression) if isinstance(compression, str) else compression

                level = section_data.get('level', 0)
                level = CompressionLevel(level) if isinstance(level, int) else level

                metadata.sections[name] = {
                    'offset': section_data.get('offset', 0),
                    'size': section_data.get('size', 0),
                    'compression': compression,
                    'level': level,
                    'compressed_size': section_data.get('compressed_size', 0),
                    'hash': section_data.get('hash', '')
                }

        return metadata


# Convenience functions for common compression operations

def compress_data(
    data: bytes,
    level: CompressionLevel = CompressionLevel.AUTO,
    content_type: ContentType = ContentType.UNKNOWN
) -> CompressionResult:
    """
    Compress data with adaptive compression.

    Args:
        data: Data to compress
        level: Compression level
        content_type: Content type (auto-detected if UNKNOWN)

    Returns:
        CompressionResult with compressed data
    """
    compressor = AdaptiveCompressor(default_level=level)
    return compressor.compress(data, content_type)


def decompress_data(data: bytes, expected_size: int = None) -> bytes:
    """
    Decompress Zstandard or zlib compressed data.

    Args:
        data: Compressed data
        expected_size: Expected uncompressed size

    Returns:
        Decompressed data
    """
    return ZstdH5Compressor.decompress(data, expected_size)


def is_compressed(data: bytes) -> bool:
    """
    Check if data is compressed (detects Zstandard/zlib).

    Args:
        data: Data to check

    Returns:
        True if data appears to be compressed
    """
    if not data or len(data) < 4:
        return False

    # Zstandard frame magic
    if data[0:4] == b'\x28\xb5\x2f':
        return True

    # Zlib header
    if data[0:2] == b'\x78\x9c' or data[0:2] == b'\x78\xda':
        return True

    return False

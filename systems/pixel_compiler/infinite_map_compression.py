#!/usr/bin/env python3
"""
Infinite Map Transparent Compression.

Automatic compression for files in cold zone using zstandard.
Files are compressed on write and decompressed on read.
"""

import json
import time
from typing import Dict, List, Optional, Any, Tuple
from dataclasses import dataclass, field

# Mock compression for testing (when zstandard not available)
class MockCompressor:
    """Mock compressor for testing without zstandard."""
    def __init__(self, level=3):
        self.level = level
    def compress(self, data):
        # Mock: just wrap data
        return b"ZSTD:" + data

class MockDecompressor:
    """Mock decompressor for testing without zstandard."""
    def decompress(self, data):
        # Mock: unwrap data
        if data.startswith(b"ZSTD:"):
            return data[5:]
        return data

# Try to import zstandard
try:
    import zstandard as zstd
    ZSTD_AVAILABLE = True
    ZstdCompressor = zstd.ZstdCompressor
    ZstdDecompressor = zstd.ZstdDecompressor
except ImportError:
    ZSTD_AVAILABLE = False
    # Use mock classes
    ZstdCompressor = MockCompressor
    ZstdDecompressor = MockDecompressor


@dataclass
class CompressionMetadata:
    """Metadata for compressed file."""
    path: str
    compressed: bool
    original_size: int
    compressed_size: int
    algorithm: str = "zstd"
    compressed_at: float = field(default_factory=time.time)


class CompressionEngine:
    """
    Transparent compression engine for cold zone files.

    Compresses files that haven't been accessed recently using zstandard.
    Automatically decompresses on access.

    Features:
    - compress_file() - Compress file data
    - decompress_file() - Decompress file data
    - should_compress() - Decide if file should be compressed
    - get_compression_metadata() - Get file compression info
    """

    VERSION = "1.0"

    def __init__(self, compress_threshold: int = 3600, compression_level: int = 3):
        """
        Initialize compression engine.

        Args:
            compress_threshold: Access age threshold (seconds) for compression
            compression_level: Zstandard compression level (1-22)
        """
        self.compress_threshold = compress_threshold
        self.compression_level = compression_level

        # Compression cache: path -> compressed data
        self.compression_cache: Dict[str, bytes] = {}

        # Metadata: path -> CompressionMetadata
        self.metadata: Dict[str, CompressionMetadata] = {}

        # Statistics
        self.total_compressed = 0
        self.total_decompressed = 0
        self.total_bytes_saved = 0

    def compress_file(self, path: str, data: bytes,
                   file_size: Optional[int] = None) -> Optional[bytes]:
        """
        Compress file data using zstandard.

        Args:
            path: File path
            data: Original data
            file_size: Size of data (if None, uses len(data))

        Returns:
            Compressed data, or None if compression not beneficial
        """
        if file_size is None:
            file_size = len(data)

        # Skip if too small (compression won't help)
        if file_size < 512:
            return None

        # Create compressor
        cctx = ZstdCompressor(level=self.compression_level)

        # Compress
        compressed = cctx.compress(data)

        # Check if compression is beneficial (saves at least 10%)
        if len(compressed) >= file_size * 0.9:
            return None

        # Store compressed data
        self.compression_cache[path] = compressed

        # Update metadata
        self.metadata[path] = CompressionMetadata(
            path=path,
            compressed=True,
            original_size=file_size,
            compressed_size=len(compressed)
        )

        # Update statistics
        self.total_compressed += 1
        self.total_bytes_saved += (file_size - len(compressed))

        return compressed

    def decompress_file(self, compressed_data: bytes) -> bytes:
        """
        Decompress file data using zstandard.

        Args:
            compressed_data: Compressed data

        Returns:
            Original decompressed data
        """
        dctx = ZstdDecompressor()
        decompressed = dctx.decompress(compressed_data)

        self.total_decompressed += 1

        return decompressed

    def should_compress(self, location, access_age: int) -> bool:
        """
        Decide if file should be compressed based on access.

        Args:
            location: ClusterLocation of file
            access_age: Time since last access (seconds)

        Returns:
            True if file should be compressed
        """
        # Compress if access age exceeds threshold
        return access_age > self.compress_threshold

    def get_compression_metadata(self, path: str) -> Optional[CompressionMetadata]:
        """
        Get compression metadata for file.

        Args:
            path: File path

        Returns:
            CompressionMetadata or None if not compressed
        """
        return self.metadata.get(path)

    def get_cache_size(self) -> int:
        """Get size of compression cache in bytes."""
        return sum(len(data) for data in self.compression_cache.values())

    def clear_cache(self):
        """Clear compression cache and metadata."""
        self.compression_cache.clear()
        self.metadata.clear()

    def batch_compress(self, files: Dict[str, bytes]) -> Dict[str, Optional[bytes]]:
        """
        Compress multiple files.

        Args:
            files: Dictionary mapping path -> data

        Returns:
            Dictionary mapping path -> compressed data (or None if not compressed)
        """
        results = {}
        for path, data in files.items():
            compressed = self.compress_file(path, data)
            results[path] = compressed

        return results

    def get_statistics(self) -> Dict[str, Any]:
        """
        Get compression statistics.

        Returns:
            Dictionary with statistics
        """
        total_original = sum(m.original_size for m in self.metadata.values())
        total_compressed = sum(m.compressed_size for m in self.metadata.values())

        compression_ratio = (total_compressed / total_original) if total_original > 0 else 0

        return {
            'total_files': len(self.metadata),
            'total_compressed': self.total_compressed,
            'total_decompressed': self.total_decompressed,
            'total_bytes_saved': self.total_bytes_saved,
            'compression_ratio': compression_ratio,
            'cache_size': self.get_cache_size(),
        }

    def export_compression_table(self) -> Dict[str, Any]:
        """
        Export compression table for persistence.

        Returns:
            Dictionary with compression table and metadata
        """
        # Convert metadata to serializable format
        table_data = {
            path: {
                'compressed': meta.compressed,
                'original_size': meta.original_size,
                'compressed_size': meta.compressed_size,
                'algorithm': meta.algorithm,
                'compressed_at': meta.compressed_at,
            }
            for path, meta in self.metadata.items()
        }

        return {
            'version': self.VERSION,
            'export_time': time.time(),
            'compression_level': self.compression_level,
            'compression_table': table_data,
        }

    def import_compression_table(self, data: Dict[str, Any]):
        """
        Import compression table from exported data.

        Args:
            data: Dictionary from export_compression_table()
        """
        version = data.get('version', '')
        if version != self.VERSION:
            raise ValueError(f"Version mismatch: expected {self.VERSION}, got {version}")

        table_data = data.get('compression_table', {})

        # Restore metadata
        for path, meta in table_data.items():
            self.metadata[path] = CompressionMetadata(
                path=path,
                compressed=meta['compressed'],
                original_size=meta['original_size'],
                compressed_size=meta['compressed_size'],
                algorithm=meta.get('algorithm', 'zstd'),
                compressed_at=meta.get('compressed_at', time.time()),
            )


def main():
    """CLI for compression system testing."""
    import argparse
    import sys

    parser = argparse.ArgumentParser(
        description='Infinite Map Compression Engine',
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument('--compress', metavar='PATH',
                      help='Compress a file (requires --data)')
    parser.add_argument('--data', metavar='HEX',
                      help='File data as hex string')
    parser.add_argument('--decompress', metavar='PATH',
                      help='Decompress a file')
    parser.add_argument('--stats', action='store_true',
                      help='Show compression statistics')
    parser.add_argument('--export', metavar='FILE',
                      help='Export compression table')
    parser.add_argument('--import', metavar='FILE',
                      dest='import_path',
                      help='Import compression table')

    args = parser.parse_args()

    try:
        engine = CompressionEngine()

        if args.compress:
            if not args.data:
                print("[!] Error: --data required for --compress")
                sys.exit(1)

            data = bytes.fromhex(args.data)
            compressed = engine.compress_file(args.compress, data)
            if compressed:
                ratio = (len(compressed) / len(data)) * 100
                print(f"[*] Compressed: {args.compress}")
                print(f"    Original: {len(data)} bytes")
                print(f"    Compressed: {len(compressed)} bytes")
                print(f"    Ratio: {ratio:.1f}%")
            else:
                print(f"[!] Compression not beneficial for: {args.compress}")

        if args.decompress:
            print(f"[*] Decompressing: {args.decompress}")
            print("[!] Decompression from file not implemented (requires cache)")

        if args.stats:
            stats = engine.get_statistics()
            print(f"[*] Compression Statistics:")
            print(f"    Total files: {stats['total_files']}")
            print(f"    Compressed: {stats['total_compressed']}")
            print(f"    Decompressed: {stats['total_decompressed']}")
            print(f"    Bytes saved: {stats['total_bytes_saved']}")
            print(f"    Compression ratio: {stats['compression_ratio']:.2%}")

        if args.export:
            data = engine.export_compression_table()
            with open(args.export, 'w') as f:
                json.dump(data, f, indent=2)
            print(f"[*] Exported compression table to: {args.export}")

        if args.import_path:
            with open(args.import_path, 'r') as f:
                data = json.load(f)
            engine.import_compression_table(data)
            print(f"[*] Imported compression table from: {args.import_path}")

        if not any([args.compress, args.decompress, args.stats, args.export, args.import_path]):
            parser.print_help()

    except Exception as e:
        print(f"[!] Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()

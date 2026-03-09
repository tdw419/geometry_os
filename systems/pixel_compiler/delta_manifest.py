"""
Delta Manifest Generator
Generates JSON manifests describing byte-level changes between two .rts.png versions.
"""

import hashlib
from dataclasses import dataclass, field, asdict
from typing import List, Optional
from datetime import datetime, timezone
import json


@dataclass
class DeltaRegion:
    """
    Represents a changed byte region in a delta manifest.

    Attributes:
        offset: Byte offset from start of file
        length: Number of changed bytes
        checksum: SHA-256 hash of new bytes in this region
        old_checksum: SHA-256 hash of old bytes (for validation)
        compression: Compression hint ("none", "zlib", "lz4")
        source_offset: Offset in old file (for moves/copies)
    """
    offset: int
    length: int
    checksum: str
    old_checksum: Optional[str] = None
    compression: str = "none"
    source_offset: Optional[int] = None

    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization."""
        return asdict(self)

    @classmethod
    def from_dict(cls, data: dict) -> 'DeltaRegion':
        """Create DeltaRegion from dictionary."""
        return cls(
            offset=data['offset'],
            length=data['length'],
            checksum=data['checksum'],
            old_checksum=data.get('old_checksum'),
            compression=data.get('compression', 'none'),
            source_offset=data.get('source_offset')
        )


@dataclass
class DeltaManifest:
    """
    Manifest describing changes between two .rts.png file versions.

    Contains metadata about the files, overall checksums, and a list
    of changed byte regions with their individual checksums.

    Attributes:
        version: Manifest format version
        old_file: Path to old file
        new_file: Path to new file
        old_size: Size of old file in bytes
        new_size: Size of new file in bytes
        old_checksum: SHA-256 of entire old file
        new_checksum: SHA-256 of entire new file
        regions: List of changed regions
        unchanged_bytes: Count of bytes that didn't change
        compression_ratio: Percentage of file that changed (0-100)
        generated_at: ISO timestamp of manifest generation
    """
    version: str = "1.0"
    old_file: str = ""
    new_file: str = ""
    old_size: int = 0
    new_size: int = 0
    old_checksum: str = ""
    new_checksum: str = ""
    regions: List[DeltaRegion] = field(default_factory=list)
    unchanged_bytes: int = 0
    compression_ratio: float = 0.0
    generated_at: str = ""

    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization."""
        return {
            'version': self.version,
            'old_file': self.old_file,
            'new_file': self.new_file,
            'old_size': self.old_size,
            'new_size': self.new_size,
            'old_checksum': self.old_checksum,
            'new_checksum': self.new_checksum,
            'regions': [r.to_dict() for r in self.regions],
            'unchanged_bytes': self.unchanged_bytes,
            'compression_ratio': self.compression_ratio,
            'generated_at': self.generated_at
        }

    def to_json(self, indent: int = 2) -> str:
        """
        Convert DeltaManifest to JSON string.

        Args:
            indent: JSON indentation level (default: 2)

        Returns:
            JSON string representation of the manifest
        """
        return json.dumps(self.to_dict(), indent=indent)

    @classmethod
    def from_dict(cls, data: dict) -> 'DeltaManifest':
        """Create DeltaManifest from dictionary."""
        regions = [DeltaRegion.from_dict(r) for r in data.get('regions', [])]
        return cls(
            version=data.get('version', '1.0'),
            old_file=data.get('old_file', ''),
            new_file=data.get('new_file', ''),
            old_size=data.get('old_size', 0),
            new_size=data.get('new_size', 0),
            old_checksum=data.get('old_checksum', ''),
            new_checksum=data.get('new_checksum', ''),
            regions=regions,
            unchanged_bytes=data.get('unchanged_bytes', 0),
            compression_ratio=data.get('compression_ratio', 0.0),
            generated_at=data.get('generated_at', '')
        )

    @classmethod
    def from_json(cls, json_str: str) -> 'DeltaManifest':
        """
        Parse JSON string back to DeltaManifest.

        Args:
            json_str: JSON string to parse

        Returns:
            DeltaManifest object

        Raises:
            ValueError: If JSON is invalid or missing required fields
        """
        try:
            data = json.loads(json_str)
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid JSON: {e}")

        # Validate required fields
        required = ['old_file', 'new_file', 'old_checksum', 'new_checksum']
        missing = [f for f in required if f not in data]
        if missing:
            raise ValueError(f"Missing required fields: {missing}")

        return cls.from_dict(data)

    def save(self, path: str) -> None:
        """
        Write manifest to file as JSON.

        Args:
            path: Output file path
        """
        with open(path, 'w') as f:
            f.write(self.to_json())

    @classmethod
    def load(cls, path: str) -> 'DeltaManifest':
        """
        Load manifest from JSON file.

        Args:
            path: Path to manifest file

        Returns:
            DeltaManifest object

        Raises:
            FileNotFoundError: If file doesn't exist
            ValueError: If file contains invalid JSON or manifest
        """
        with open(path, 'r') as f:
            return cls.from_json(f.read())


def _sha256_region(data: bytes, offset: int, length: int) -> str:
    """
    Compute SHA-256 hash of a byte region.

    Args:
        data: Full byte array
        offset: Start offset
        length: Number of bytes to hash

    Returns:
        Hex digest of SHA-256 hash
    """
    region = data[offset:offset + length]
    return hashlib.sha256(region).hexdigest()


def _find_contiguous_regions(diff_mask, min_size: int = 64) -> List[tuple]:
    """
    Convert boolean diff_mask to list of contiguous (offset, length) tuples.

    Merges small gaps (< min_size) to reduce region count.

    Args:
        diff_mask: Boolean numpy array where True = changed byte
        min_size: Minimum gap size to keep separate regions

    Returns:
        List of (offset, length) tuples for changed regions
    """
    import numpy as np

    if not np.any(diff_mask):
        return []

    # Find indices of changed bytes
    changed_indices = np.where(diff_mask)[0]

    if len(changed_indices) == 0:
        return []

    regions = []
    start = int(changed_indices[0])
    end = start

    for idx in changed_indices[1:]:
        idx = int(idx)
        # If gap is small, merge into current region
        if idx <= end + min_size:
            end = idx
        else:
            # Save current region and start new one
            regions.append((start, end - start + 1))
            start = idx
            end = idx

    # Don't forget the last region
    regions.append((start, end - start + 1))

    return regions


def generate_delta_manifest(old_path: str, new_path: str) -> DeltaManifest:
    """
    Generate a delta manifest between two .rts.png files.

    Uses PixelRTSDiffer to identify changed regions, then computes
    checksums and builds the manifest structure.

    Args:
        old_path: Path to the original .rts.png file
        new_path: Path to the new/modified .rts.png file

    Returns:
        DeltaManifest with all changed regions and metadata

    Raises:
        FileNotFoundError: If either file doesn't exist
        ValueError: If files are invalid
    """
    from pathlib import Path
    from systems.pixel_compiler.pixelrts_diff import PixelRTSDiffer

    # Validate files exist
    old_path_obj = Path(old_path)
    new_path_obj = Path(new_path)

    if not old_path_obj.exists():
        raise FileNotFoundError(f"Old file not found: {old_path}")
    if not new_path_obj.exists():
        raise FileNotFoundError(f"New file not found: {new_path}")

    # Use PixelRTSDiffer to get diff result
    differ = PixelRTSDiffer()
    diff_result = differ.diff(old_path, new_path)

    # Read raw bytes for checksum computation
    with open(old_path, 'rb') as f:
        old_png_bytes = f.read()
    with open(new_path, 'rb') as f:
        new_png_bytes = f.read()

    # Decode to get raw data bytes
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
    decoder = PixelRTSDecoder()

    decoder._metadata = None
    old_data = decoder.decode(old_png_bytes)
    old_metadata = decoder.get_metadata()

    decoder._metadata = None
    new_data = decoder.decode(new_png_bytes)
    new_metadata = decoder.get_metadata()

    # Compute overall file checksums
    old_checksum = hashlib.sha256(old_data).hexdigest()
    new_checksum = hashlib.sha256(new_data).hexdigest()

    # Get diff mask from result
    diff_mask = diff_result.get('diff_mask')

    # Find contiguous changed regions
    regions = []
    if diff_mask is not None and len(diff_mask) > 0:
        import numpy as np

        # Pad old_data and new_data to match diff_mask length if needed
        total_bytes = len(diff_mask)
        old_array = np.frombuffer(old_data, dtype=np.uint8) if len(old_data) > 0 else np.array([], dtype=np.uint8)
        new_array = np.frombuffer(new_data, dtype=np.uint8) if len(new_data) > 0 else np.array([], dtype=np.uint8)

        # Pad to match diff_mask length
        if len(old_array) < total_bytes:
            old_array = np.pad(old_array, (0, total_bytes - len(old_array)), mode='constant')
        if len(new_array) < total_bytes:
            new_array = np.pad(new_array, (0, total_bytes - len(new_array)), mode='constant')

        # Convert to bytes for checksum computation
        old_bytes = bytes(old_array)
        new_bytes = bytes(new_array)

        # Find contiguous regions
        region_tuples = _find_contiguous_regions(diff_mask, min_size=64)

        for offset, length in region_tuples:
            # Compute checksums for this region
            new_region_checksum = _sha256_region(new_bytes, offset, length)

            # Old checksum (for validation on client side)
            old_region_checksum = _sha256_region(old_bytes, offset, length) if offset < len(old_bytes) else None

            region = DeltaRegion(
                offset=offset,
                length=length,
                checksum=new_region_checksum,
                old_checksum=old_region_checksum,
                compression="none"
            )
            regions.append(region)

    # Calculate compression ratio (percentage of file that changed)
    total_bytes = diff_result.get('total_bytes', 0)
    changed_bytes = (
        diff_result.get('added_bytes', 0) +
        diff_result.get('removed_bytes', 0) +
        diff_result.get('changed_bytes', 0)
    )

    if total_bytes > 0:
        compression_ratio = round((changed_bytes / total_bytes) * 100, 2)
    else:
        compression_ratio = 0.0

    # Build manifest
    manifest = DeltaManifest(
        version="1.0",
        old_file=str(old_path),
        new_file=str(new_path),
        old_size=len(old_data),
        new_size=len(new_data),
        old_checksum=old_checksum,
        new_checksum=new_checksum,
        regions=regions,
        unchanged_bytes=diff_result.get('unchanged_bytes', 0),
        compression_ratio=compression_ratio,
        generated_at=datetime.now(timezone.utc).isoformat()
    )

    return manifest

#!/usr/bin/env python3
"""
Infinite Map OS Builder v2 - True Spatial Storage

Implements Visual Allocation Table (VAT) for true
coordinate-based file placement. Files are physically
written to their calculated (x, y) positions on the
Hilbert curve, not just linearly encoded.

This means:
- Metadata "location" matches actual physical storage
- Hot files are literally at center for fastest GPU access
- Visual representation is accurate
- Performance characteristics match spatial layout
"""

import os
import sys
import struct
import json
import math
import random
from pathlib import Path
from typing import Dict, List, Tuple, Optional, TYPE_CHECKING
from datetime import datetime
from collections import defaultdict
import numpy as np

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixel_compiler.pixelrts_v2_core import (
    PixelRTSEncoder,
    calculate_grid_size
)


# Constants
INFIN2_MAGIC = b'INFIN2\x00'
VERSION = 2  # Upgraded from INFIN1

# File types
FILE_TYPE_FILE = 1
FILE_TYPE_DIR = 2
FILE_TYPE_SYMLINK = 3
FILE_TYPE_COMPONENT = 4

# Zone definitions
ZONE_HOT = 0       # Center: < 128 from center
ZONE_WARM = 1      # < 384 from center
ZONE_TEMPERATE = 2  # < 768 from center
ZONE_COOL = 3      # < 1536 from center
ZONE_COLD = 4      # < 2048 from center (edges)


class ClusterLocation:
    """Represents a cluster's spatial location."""

    def __init__(self, x: int, y: int):
        self.x = x
        self.y = y

    def __repr__(self):
        return f"({self.x}, {self.y})"

    def to_bytes(self) -> bytes:
        """Pack cluster location to bytes."""
        return struct.pack('<HH', self.x, self.y)

    @staticmethod
    def from_bytes(data: bytes) -> 'ClusterLocation':
        """Unpack cluster location from bytes."""
        x, y = struct.unpack('<HH', data)
        return ClusterLocation(x, y)

    def distance_to(self, other: 'ClusterLocation') -> float:
        """Calculate Euclidean distance to another location."""
        dx = self.x - other.x
        dy = self.y - other.y
        return math.sqrt(dx*dx + dy*dy)

    def to_linear_index(self, grid_size: int) -> int:
        """
        Convert (x, y) to linear index using Hilbert curve.
        This is needed to write data to the correct pixel position.
        """
        # Generate Hilbert LUT
        from pixel_compiler.pixelrts_v2_core import HilbertCurve
        order = int(math.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()

        # Find index for this coordinate
        for idx, coord in enumerate(lut):
            if coord[0] == self.x and coord[1] == self.y:
                return idx

        # Fallback (shouldn't happen if coord is valid)
        raise ValueError(f"Coordinate ({self.x}, {self.y}) not in Hilbert LUT")

    def is_in_zone(self, center: Tuple[int, int], zone_size: int) -> bool:
        """Check if this location is within a zone."""
        return (
            center[0] - zone_size <= self.x < center[0] + zone_size and
            center[1] - zone_size <= self.y < center[1] + zone_size
        )

class FATEntry:
    """FAT32-like filesystem entry."""

    SIZE = 96  # Size of entry in bytes

    def __init__(
        self,
        name: str,
        first_cluster: ClusterLocation,
        size: int,
        mode: int = 0o644,
        mtime: int = 0,
        file_type: int = FILE_TYPE_FILE,
        importance: int = 128,  # Default medium importance
        flags: int = 0,
        checksum: int = 0
    ):
        self.name = name[:64]
        self.first_cluster = first_cluster
        self.size = size
        self.mode = mode
        self.mtime = mtime
        self.file_type = file_type
        self.importance = importance
        self.flags = flags
        self.checksum = checksum

    def to_bytes(self) -> bytes:
        """Pack entry to bytes."""
        data = bytearray()
        name_bytes = self.name.encode('utf-8')[:64]
        data.extend(name_bytes.ljust(64, b'\x00'))
        data.extend(self.first_cluster.to_bytes())
        data.extend(struct.pack('<I', self.size))
        data.extend(struct.pack('<I', self.mode))
        data.extend(struct.pack('<I', self.mtime))
        data.extend(struct.pack('<B', self.file_type))
        data.extend(struct.pack('<B', self.importance))
        data.extend(struct.pack('<H', self.flags))
        data.extend(b'\x00')  # Reserved
        data.extend(struct.pack('<I', self.checksum))
        return bytes(data)

    @staticmethod
    def from_bytes(data: bytes) -> 'FATEntry':
        name = data[0:64].split(b'\x00')[0].decode('utf-8')
        cluster = ClusterLocation.from_bytes(data[64:68])
        size = struct.unpack('<I', data[68:72])[0]
        mode = struct.unpack('<I', data[72:76])[0]
        mtime = struct.unpack('<I', data[76:80])[0]
        file_type = data[80]
        importance = data[81]
        flags = struct.unpack('<H', data[82:84])[0]
        checksum = struct.unpack('<I', data[84:88])[0]
        return FATEntry(name, cluster, size, mode, mtime, file_type, importance, flags, checksum)

class VisualAllocationTable:
    """
    Visual Allocation Table (VAT).

    Tracks the actual physical location of each file/cluster.
    This is what makes metadata "location" accurate - it references
    this table.
    """

    def __init__(
        self,
        grid_size: int,
        max_entries: int = 65536,
        center: Optional[Tuple[int, int]] = None,  # ADD THIS
        entries: Optional[Dict[str, List[ClusterLocation]]] = None  # ADD THIS
    ):
        self.grid_size = grid_size
        self.max_entries = max_entries

        # Use provided center or compute default
        if center is None:
            self.center = ClusterLocation(grid_size // 2, grid_size // 2)
        else:
            self.center = center

        # VAT entries: [name] -> [ClusterLocation, ...]
        # Each file can have multiple clusters (fragmented files)
        self.entries: Dict[str, List[ClusterLocation]] = entries if entries is not None else {}

        # Free cluster bitmap (for allocation)
        self.free_clusters: List[ClusterLocation] = []

        # Track allocated clusters for free list initialization
        allocated_clusters = set()
        for cluster_list in self.entries.values():
            for cluster in cluster_list:
                allocated_clusters.add((cluster.x, cluster.y))

        # Initialize only unallocated clusters as free
        # A cluster is 4096 bytes = 1024 pixels. 
        # For spatial storage that's consistent with FUSE, 
        # clusters must be segments of the Hilbert curve.
        
        from pixel_compiler.pixelrts_v2_core import HilbertCurve
        order = int(math.log2(grid_size))
        hilbert = HilbertCurve(order=order)
        lut = hilbert.generate_lut()
        
        # Only every 1024th pixel can be a cluster start
        for t in range(0, grid_size * grid_size, 1024):
            x, y = lut[t]
            if (x, y) not in allocated_clusters:
                self.free_clusters.append(ClusterLocation(x, y))

    def allocate(self, name: str, size: int, preferred_location: Optional[ClusterLocation] = None) -> List[ClusterLocation]:
        """
        Allocate clusters for a file.

        Returns list of allocated cluster locations.
        """
        clusters_needed = (size + 4095) // 4096  # 4KB clusters

        allocated = []

        for i in range(clusters_needed):
            if preferred_location and i == 0:
                # Use preferred location for first cluster
                if preferred_location in self.free_clusters:
                    loc = preferred_location
                    self.free_clusters.remove(loc)
                else:
                    # Preferred not available, find nearest free
                    loc = self._find_nearest_free(preferred_location)
                    if loc:
                        self.free_clusters.remove(loc)
                    else:
                        raise RuntimeError("No free clusters")
            else:
                # Find best available cluster
                loc = self._find_best_free_cluster()

                if not loc:
                    raise RuntimeError("No free clusters available")

                self.free_clusters.remove(loc)
                allocated.append(loc)

        # Record in VAT
        self.entries[name] = allocated[0] if allocated else None

        return allocated

    def _find_best_free_cluster(self) -> Optional[ClusterLocation]:
        """
        Find best free cluster using heuristics.

        Prefers:
        1. Locations closer to center (hot zone)
        2. Locations with spatial locality to other allocations
        """
        if not self.free_clusters:
            return None

        # Score each free cluster
        best = None
        best_score = float('-inf')

        for loc in self.free_clusters:
            score = self._score_location(loc)
            if score > best_score:
                best_score = score
                best = loc

        return best

    def _score_location(self, loc: ClusterLocation) -> float:
        """
        Score a location for allocation preference.

        Lower score = better (closer to center, less fragmented).
        """
        # Distance from center (prefer closer)
        dist = loc.distance_to(self.center)
        center_score = 1.0 - (dist / (self.grid_size // 2))

        # Spatial locality (prefer near existing allocations)
        locality_bonus = 0.0
        for allocated_locs in self.entries.values():
            if allocated_locs:
                # Use first cluster as proxy for file location
                # (Could iterate all, but expensive)
                d = loc.distance_to(allocated_locs[0])
                if d < 256:  # Within warm zone
                    locality_bonus += 0.1

        return center_score + locality_bonus

    def _find_nearest_free(self, preferred: ClusterLocation) -> Optional[ClusterLocation]:
        """Find nearest free cluster to preferred location."""
        best = None
        best_dist = float('inf')

        for loc in self.free_clusters:
            dist = loc.distance_to(preferred)
            if dist < best_dist:
                best_dist = dist
                best = loc

        return best

    def lookup(self, name: str) -> Optional[ClusterLocation]:
        """Look up file's first cluster location in VAT."""
        locs = self.entries.get(name)
        if locs and len(locs) > 0:
            return locs[0]  # Return first cluster
        return None

    def get_allocation_map(self) -> np.ndarray:
        """
        Get visual allocation map as 2D numpy array.

        Returns grid_size x grid_size array where:
        - 0 = free
        - 1 = allocated (value = file index)
        """
        alloc_map = np.zeros((self.grid_size, self.grid_size), dtype=np.uint8)

        # Mark allocated clusters
        for name, loc in self.entries.items():
            if loc:
                alloc_map[loc.y, loc.x] = 1

        return alloc_map

    def to_json(self) -> dict:
        """Serialize VAT to JSON (full cluster chains)."""
        entries = {}
        for name, locs in self.entries.items():
            if locs:
                entries[name] = [[l.x, l.y] for l in locs]
            else:
                entries[name] = []

        return {
            'format': 'visual-allocation-table-v2',
            'version': '2.0',
            'grid_size': self.grid_size,
            'center': [self.center.x, self.center.y],
            'total_entries': len(self.entries),
            'entries': entries
        }


class SuperblockV2:
    """Infinite Map v2 superblock with VAT pointer."""

    SIZE = 4096  # 4KB superblock

    def __init__(
        self,
        grid_size: int = 2048,
        cluster_size: int = 4096,
        vat_offset: int = None,
        fat_entries: int = 65536
    ):
        self.magic = INFIN2_MAGIC
        self.version = VERSION
        self.grid_size = grid_size
        self.cluster_size = cluster_size
        self.fat_entries = fat_entries

        # Calculate center coordinates
        self.center = ClusterLocation(grid_size // 2, grid_size // 2)

        # VAT location (comes after FAT)
        if vat_offset is None:
            # Default VAT at end of reserved space
            reserved_space = self.cluster_size + (fat_entries * 96)  # FAT entries
            vat_offset = reserved_space
        self.vat_offset = vat_offset

    def to_bytes(self, vat_size: int) -> bytes:
        """Pack superblock to bytes."""
        data = bytearray()

        # Magic
        data.extend(self.magic)

        # Version
        data.extend(struct.pack('<H', self.version))

        # Grid size
        data.extend(struct.pack('<H', self.grid_size))

        # Cluster size
        data.extend(struct.pack('<I', self.cluster_size))

        # VAT offset (where to find Visual Allocation Table)
        data.extend(struct.pack('<I', self.vat_offset))

        # VAT size
        data.extend(struct.pack('<I', vat_size))

        # Center coordinates (hot zone center)
        data.extend(struct.pack('<HH', self.center.x, self.center.y))

        # FAT entries count
        data.extend(struct.pack('<I', self.fat_entries))

        # Reserved (pad to SIZE)
        data.extend(b'\x00' * (self.SIZE - len(data)))

        return bytes(data)

    @staticmethod
    def from_bytes(data: bytes) -> 'SuperblockV2':
        """Unpack superblock from bytes."""
        if not data.startswith(INFIN2_MAGIC):
            raise ValueError("Invalid Infinite Map v2 magic")

        version = struct.unpack_from('<H', data, 8)[0]
        grid_size = struct.unpack_from('<H', data, 10)[0]
        cluster_size = struct.unpack_from('<I', data, 12)[0]
        vat_offset = struct.unpack_from('<I', data, 16)[0]
        center_x = struct.unpack_from('<H', data, 20)[0]
        center_y = struct.unpack_from('<H', data, 22)[0]
        fat_entries = struct.unpack_from('<I', data, 24)[0]

        return SuperblockV2(
            grid_size=grid_size,
            cluster_size=cluster_size,
            vat_offset=vat_offset,
            fat_entries=fat_entries
        )


class AIPlacerV2:
    """AI-driven component placement with true spatial storage."""

    def __init__(self, grid_size: int = 2048, vat: 'VisualAllocationTable' = None, importance_overrides: Dict[str, int] = None):
        self.grid_size = grid_size
        self.center = ClusterLocation(grid_size // 2, grid_size // 2)
        self.importance_overrides = importance_overrides or {}

        # Compute zone thresholds dynamically based on grid size
        self.zone_hot_threshold = grid_size // 64
        self.zone_warm_threshold = grid_size * 3 // 64
        self.zone_temperate_threshold = grid_size // 16
        self.zone_cool_threshold = grid_size // 8
        self.zone_cold_threshold = grid_size * 3 // 8

        # Create or store reference to VAT
        if vat is None:
            self.vat = VisualAllocationTable(grid_size)
        else:
            self.vat = vat

        # Initialize all clusters as free
        for x in range(grid_size):
            for y in range(grid_size):
                self.vat.free_clusters.append(ClusterLocation(x, y))

    def calculate_importance(self, file_path: str, file_size: int) -> int:
        """
        Calculate importance score for a file.

        Returns: 0-255 (higher = more important = more central)
        """
        # Check overrides first (Phase 2.2: Hot Data Migration)
        if file_path in self.importance_overrides:
            return self.importance_overrides[file_path]

        path_parts = file_path.lower().split('/')

        # Critical boot files - highest importance (goes to exact center)
        if path_parts[0] == 'boot':
            if 'vmlinuz' in file_path or 'kernel' in file_path:
                return 255  # Maximum importance - exact center
            if 'initramfs' in file_path or 'initrd' in file_path:
                return 253  # Near center
            return 240

        # Core libraries (very high importance)
        if 'lib/libc.so' in file_path or 'lib/ld-linux' in file_path:
            return 245
        if 'lib/libm.so' in file_path or 'lib/libdl.so' in file_path:
            return 243

        # Core runtime (high importance)
        if 'system/' in file_path and ('runtime' in file_path or 'daemon' in file_path):
            return 235

        # Essential tools (high importance)
        if any(x in file_path for x in ['/bin/sh', '/bin/bash', '/bin/busybox']):
            return 230

        # Configuration files (medium-high importance)
        if file_path.startswith('etc/') or 'config' in file_path:
            return 200

        # Shared libraries (medium importance)
        if file_path.startswith('lib/') or file_path.startswith('usr/lib/'):
            return 190

        # User binaries (medium importance)
        if file_path.startswith('bin/') or file_path.startswith('usr/bin/'):
            return 180

        # Models (large but important - lower-medium due to size)
        if file_path.startswith('models/') or '.gguf' in file_path:
            return 160

        # Documentation (low importance)
        if any(x in file_path for x in ['/doc/', '/man/', 'README']):
            return 100

        # Home directories (low-medium importance)
        if file_path.startswith('home/'):
            return 120

        # Cache/temp (lowest importance)
        if any(x in file_path for x in ['/cache', '/tmp', '/var/cache']):
            return 50

        # Archive/backup (lowest importance)
        if any(x in file_path for x in ['/backup', '/old', '/archive']):
            return 30

        # Default: low-medium importance
        return 100

    def place_file(self, file_path: str, file_data: bytes, preferred_loc: Optional[ClusterLocation] = None) -> List[ClusterLocation]:
        """
        Place a file at its actual spatial location.

        This is the KEY DIFFERENCE from v1:
        - Files are WRITTEN to their calculated (x,y) coordinates
        - VAT accurately reflects physical storage location
        - Visual representation is accurate
        """
        importance = self.calculate_importance(file_path, len(file_data))

        # Calculate target distance from center based on importance
        # Importance 255 = center (0 distance)
        # Importance 128 = mid-radius
        # Importance 0 = edge
        max_dist = int((1.0 - (importance / 255.0)) * (self.grid_size // 2))

        # Find location
        if preferred_loc:
            # Use preferred location if available
            if preferred_loc in self.vat.free_clusters:
                target = preferred_loc
                self.vat.free_clusters.remove(target)
            else:
                # Find nearest free cluster to preferred
                target = self.vat._find_nearest_free(preferred_loc)
                if not target:
                    raise RuntimeError(f"No free clusters near {preferred_loc}")
                self.vat.free_clusters.remove(target)
        else:
            # Find best cluster using VAT's scoring
            target = self.vat._find_best_free_cluster()
            if not target:
                raise RuntimeError("No free clusters available")
            self.vat.free_clusters.remove(target)

        # Verify target is in correct zone
        target_dist = target.distance_to(self.center)
        expected_zone = self._get_zone_from_distance(target_dist)
        actual_zone = self._get_zone_from_location(target)

        if expected_zone != actual_zone:
            print(f"Warning: {file_path} placed at {target} (zone {actual_zone}) "
                  f"but expected zone {expected_zone}")

        # Allocate clusters
        clusters_needed = (len(file_data) + 4095) // 4096

        # First cluster is at target, rest follow spatial locality
        allocated = [target]
        for i in range(1, clusters_needed):
            # Find cluster near previous ones
            next_loc = self._find_nearby_free_cluster(allocated[-1])
            if not next_loc:
                raise RuntimeError("No free clusters for multi-cluster file")

            allocated.append(next_loc)
            self.vat.free_clusters.remove(next_loc)

        # Record in VAT (Full chain)
        self.vat.entries[file_path] = allocated

        return allocated

    def _get_zone_from_distance(self, dist: float) -> int:
        """Get zone from distance from center."""
        if dist < self.zone_hot_threshold:
            return ZONE_HOT
        elif dist < self.zone_warm_threshold:
            return ZONE_WARM
        elif dist < self.zone_temperate_threshold:
            return ZONE_TEMPERATE
        elif dist < self.zone_cool_threshold:
            return ZONE_COOL
        else:
            return ZONE_COLD

    def _get_zone_from_location(self, loc: ClusterLocation) -> int:
        """Get zone for a location."""
        dist = loc.distance_to(self.center)
        return self._get_zone_from_distance(dist)

    def _find_nearby_free_cluster(self, near: ClusterLocation, max_search: int = 32) -> Optional[ClusterLocation]:
        """Find free cluster near a given location."""
        best = None
        best_dist = float('inf')

        for loc in self.vat.free_clusters:
            dist = loc.distance_to(near)
            if dist < best_dist and dist < max_search:
                best_dist = dist
                best = loc

        return best


class InfiniteMapBuilderV2:
    """
    Builds Infinite Map OS v2 with true spatial storage
    using Visual Allocation Table (VAT).
    """

    CLUSTER_SIZE = 4096  # 4KB per cluster

    def __init__(
        self,
        source_dir: str,
        output_path: str,
        grid_size: int = 2048,
        hot_file_overrides: Dict[str, int] = None
    ):
        self.source_dir = Path(source_dir)
        self.output_path = output_path
        self.grid_size = grid_size
        self.hot_file_overrides = hot_file_overrides or {}
        self.ai_placer = AIPlacerV2(grid_size)

        # Calculate VAT size
        # Each entry: name (64) + coords (4) = 68 bytes
        # Max entries: assume 10K files max
        # Max entries: assume 10K files max
        self.max_files = 10000
        self.vat_size = 68 * self.max_files

        # Initialize superblock
        self.superblock = SuperblockV2(
            grid_size=grid_size,
            vat_offset=self.CLUSTER_SIZE  # VAT comes after superblock
        )

        # Initialize AI placer with VAT reference
        self.ai_placer = AIPlacerV2(grid_size, vat=None, importance_overrides=self.hot_file_overrides)

        self.file_data: Dict[str, bytes] = {}
        self.directory_structure: Dict[str, List[FATEntry]] = {}

        # Cache Hilbert LUT
        from pixel_compiler.pixelrts_v2_core import HilbertCurve
        order = int(math.log2(grid_size))
        self.hilbert = HilbertCurve(order=order)
        self.hilbert_lut = self.hilbert.generate_lut()

        # For reading clusters from built image (for cache integration)
        self._built_pixel_array: Optional[bytearray] = None

    def analyze_source(self) -> Dict:
        """Analyze source directory structure."""
        print(f"Analyzing source: {self.source_dir}")

        file_count = 0
        total_size = 0

        for root, dirs, files in os.walk(self.source_dir):
            for file in files:
                file_path = os.path.join(root, file)
                rel_path = os.path.relpath(file_path, self.source_dir)

                try:
                    if os.path.islink(file_path):
                        continue
                        
                    size = os.path.getsize(file_path)
                    with open(file_path, 'rb') as f:
                        self.file_data[rel_path] = f.read()

                    file_count += 1
                    total_size += size
                except (FileNotFoundError, PermissionError) as e:
                    print(f"    Warning: Skipping {file_path}: {e}")
                    continue

        return {
            'file_count': file_count,
            'total_size': total_size
        }

    def build_cluster_data(self, vat: VisualAllocationTable) -> bytearray:
        """
        Build pixel data array with spatial file placement.

        This is where the magic happens - we actually write bytes
        to their (x, y) coordinates using Hilbert curve.
        """
        # Calculate required size
        superblock_size = self.CLUSTER_SIZE
        fat_size = 96 * len(vat.entries)  # Each FAT entry = 96 bytes

        # File data size
        total_data_size = sum(len(data) for data in self.file_data.values())

        # VAT size
        vat_json = json.dumps(vat.to_json())
        vat_size = len(vat_json.encode('utf-8'))

        # Calculate metadata region size (64KB)
        metadata_json = json.dumps({
            'format': 'infinite-map-v2',
            'version': '2.0.0',
            'created_at': datetime.now().isoformat(),
            'superblock': {
                'grid_size': self.grid_size,
                'center': [self.superblock.center.x, self.superblock.center.y],
                'vat_entries': len(vat.entries)
            },
            'files': [
                {
                    'name': name,
                    'size': len(self.file_data[name]),
                    'importance': self.ai_placer.calculate_importance(name, len(self.file_data[name])),
                    'location': [locs[0].x, locs[0].y] if locs else [0, 0]
                }
                for name, locs in vat.entries.items()
            ]
        }, indent=2)

        metadata_json_bytes = metadata_json.encode('utf-8')
        metadata_size = len(metadata_json_bytes)

        # Total image size
        total_size = (
            superblock_size +
            fat_size +
            total_data_size +
            vat_size +
            metadata_size
        )

        print(f"\nImage Layout:")
        print(f"  Superblock: {superblock_size} bytes")
        print(f"  FAT: {fat_size} bytes ({len(vat.entries)} entries)")
        print(f"  File Data: {total_data_size} bytes")
        print(f"  VAT: {vat_size} bytes ({len(vat.entries)} files)")
        print(f"  Metadata: {metadata_size} bytes")
        print(f"  Total: {total_size} bytes ({total_size / 1024 / 1024:.2f} MB)")

        # Calculate minimum grid size
        min_grid = calculate_grid_size(total_size, bytes_per_pixel=4)

        if self.grid_size < min_grid:
            print(f"\nWarning: Grid size {self.grid_size} too small")
            print(f"  Adjusting to {min_grid}")
            self.grid_size = min_grid
            # Recreate superblock with new grid size
            self.superblock = SuperblockV2(grid_size=min_grid)
            self.ai_placer = AIPlacerV2(grid_size=min_grid)

        # Create pixel array
        # We'll build this as a bytearray for direct control
        # Then use PixelRTSEncoder to wrap it
        total_pixels = self.grid_size * self.grid_size
        pixel_array = bytearray(total_pixels * 4)  # RGBA

        # Helper to write to pixel at coordinate
        def write_pixel(x: int, y: int, rgba: bytes):
            """Write 4 bytes to pixel at (x, y)."""
            if 0 <= x < self.grid_size and 0 <= y < self.grid_size:
                offset = (y * self.grid_size + x) * 4
                pixel_array[offset:offset + 4] = rgba

        # Write superblock at beginning (pixel 0,0 for first part)
        sb_data = self.superblock.to_bytes(vat_size)
        sb_pixels = (len(sb_data) + 3) // 4

        for i in range(sb_pixels):
            # Superblock data spans multiple pixels
            chunk_start = i * 4
            chunk_end = min(chunk_start + 4, len(sb_data))
            chunk = sb_data[chunk_start:chunk_end].ljust(4, b'\x00')
            
            # Map i to (x, y) using Hilbert curve
            x, y = self.hilbert_lut[i]
            write_pixel(x, y, chunk)

        # Offset for FAT (starts after superblock)
        current_offset = len(sb_data)

        # Generate FAT data
        fat_data = bytearray()
        for filename, locs in vat.entries.items():
            if not locs:
                continue
            
            # Get size
            file_content = self.file_data.get(filename, b'')
            size = len(file_content)
            
            # Create FAT entry (uses FIRST cluster)
            entry = FATEntry(
                name=filename,
                first_cluster=locs[0],
                size=size,
                importance=self.ai_placer.calculate_importance(filename, size)
            )
            fat_data.extend(entry.to_bytes())
        
        # Write FAT
        fat_offset_pixels = current_offset // 4
        fat_len = len(fat_data)
        
        # Write FAT data to pixels
        # Calculate how many pixels needed
        fat_pixels = (fat_len + 3) // 4
        
        for i in range(fat_pixels):
            chunk_start = i * 4
            chunk_end = min(chunk_start + 4, fat_len)
            chunk = fat_data[chunk_start:chunk_end].ljust(4, b'\x00')
            
            # Map index to (x, y) using Hilbert
            t = fat_offset_pixels + i
            if t < len(self.hilbert_lut):
                x, y = self.hilbert_lut[t]
                write_pixel(x, y, chunk)

        current_offset += fat_len

        # Now write FILE DATA using VAT for true spatial placement
        print(f"\nWriting files to spatial coordinates...")

        for file_path, locs in vat.entries.items():
            if not locs:
                print(f"  Warning: No location for {file_path}")
                continue

            file_data = self.file_data.get(file_path, b'')

            # Write each cluster of this file
            clusters_needed = (len(file_data) + 4095) // 4096

            # Ensure we have enough allocated clusters
            if len(locs) < clusters_needed:
                print(f"  Error: Insufficient clusters allocated for {file_path}")
                continue

            for cluster_idx in range(clusters_needed):
                cluster_loc = locs[cluster_idx]

                # Calculate linear offset for this cluster
                linear_idx = cluster_loc.to_linear_index(self.grid_size)

                # Write file data to this cluster
                offset_in_cluster = cluster_idx * self.CLUSTER_SIZE
                remaining = len(file_data) - offset_in_cluster

                # Write this cluster's data
                bytes_to_write = file_data[offset_in_cluster:offset_in_cluster + min(self.CLUSTER_SIZE, remaining)]

                for byte_idx, byte_val in enumerate(bytes_to_write):
                    # Calculate total pixel index in Hilbert stream
                    # linear_idx is start of cluster
                    t = linear_idx + (byte_idx // 4)
                    ch = byte_idx % 4
                    
                    if t < len(self.hilbert_lut):
                        x, y = self.hilbert_lut[t]
                        # Write to pixel_array (row-major)
                        offset = linear_idx + ch
                        pixel_array[offset] = byte_val

            print(f"  {file_path}: {locs[0]} (zone {self.ai_placer._get_zone_from_location(locs[0])})")

        # Write VAT at its designated offset (before metadata region)
        vat_offset = self.superblock.vat_offset
        vat_offset_pixels = vat_offset // 4

        # Encode VAT as JSON
        vat_json_bytes = json.dumps(vat.to_json()).encode('utf-8')
        vat_pixels = (len(vat_json_bytes) + 3) // 4

        for i in range(vat_pixels):
            chunk_start = i * 4
            chunk_end = min(chunk_start + 4, len(vat_json_bytes))
            chunk = vat_json_bytes[chunk_start:chunk_end].ljust(4, b'\x00')
            
            # Map index to (x, y) using Hilbert
            t = vat_offset_pixels + i
            if t < len(self.hilbert_lut):
                x, y = self.hilbert_lut[t]
                write_pixel(x, y, chunk)

        current_offset = vat_offset + len(vat_json_bytes)

        # Write metadata at end (last 64KB)
        metadata_offset = total_pixels * 4 - 64 * 1024
        metadata_offset_pixels = metadata_offset // 4

        metadata_json_pixels = (len(metadata_json_bytes) + 3) // 4

        for i in range(metadata_json_pixels):
            chunk_start = i * 4
            chunk_end = min(chunk_start + 4, len(metadata_json_bytes))
            chunk = metadata_json_bytes[chunk_start:chunk_end].ljust(4, b'\x00')
            
            # Map index to (x, y) using Hilbert
            t = metadata_offset_pixels + i
            if t < len(self.hilbert_lut):
                x, y = self.hilbert_lut[t]
                write_pixel(x, y, chunk)

        # Trim to actual used size
        final_size = metadata_offset + len(metadata_json_bytes)
        # pixel_array = pixel_array[:final_size]  <-- REMOVED: Keep full grid for reshaping

        print(f"\nSpatial placement complete!")
        print(f"  Files placed: {len([v for v in vat.entries.values() if v])}")

        # Encode with PixelRTS v2
        print(f"\nEncoding as PixelRTS v2 ({self.grid_size}x{self.grid_size})...")

        encoder = PixelRTSEncoder(mode="standard")

        # Create custom PNG with our pre-built pixel array
        # We'll bypass encoder's encode() to use our spatial layout
        from PIL import Image
        from io import BytesIO
        from PIL import PngImagePlugin

        # Convert bytearray to numpy array for PIL
        img_array = np.frombuffer(pixel_array, dtype=np.uint8)
        img_array = img_array.reshape((self.grid_size, self.grid_size, 4))

        # Create image
        image = Image.fromarray(img_array, mode='RGBA')

        # Add metadata as separate tEXt chunks for easy reading
        # Each field becomes its own tEXt chunk key
        pnginfo = PngImagePlugin.PngInfo()

        # Core identification fields
        pnginfo.add_text('type', 'infinite-map-v2')
        pnginfo.add_text('name', 'Geometry OS')
        pnginfo.add_text('version', '2.0.0')
        pnginfo.add_text('grid_size', str(self.grid_size))
        pnginfo.add_text('spatial_storage', 'true')

        # VAT stats
        pnginfo.add_text('vat_entries', str(len(vat.entries)))

        # Also embed VAT JSON for validation
        pnginfo.add_text('InfiniteMap-VAT', vat_json)

        pnginfo.add_text('InfiniteMap-VAT', vat_json)

        # Keep PixelRTS metadata chunk for backward compatibility
        # (contains combined metadata in JSON format)
        from pixel_compiler.pixelrts_v2_core import PixelRTSMetadata
        combined_metadata = {
            'type': 'infinite-map-v2',
            'name': 'Geometry OS',
            'version': '2.0.0',
            'grid_size': self.grid_size,
            'spatial_storage': True,
            'vat_entries': len(vat.entries)
        }
        metadata_text = PixelRTSMetadata.encode_png_text(combined_metadata).decode('utf-8')
        pnginfo.add_text('PixelRTS', metadata_text)

        buffer = BytesIO()
        image.save(buffer, format='PNG', pnginfo=pnginfo)
        png_bytes = buffer.getvalue()

        # Write file
        with open(self.output_path, 'wb') as f:
            f.write(png_bytes)

        # Write sidecar
        sidecar_path = self.output_path + '.meta.json'
        with open(sidecar_path, 'w') as f:
            json.dump({
                'pixelrts': combined_metadata,
                'infinite_map': {
                    'vat': vat_json,
                    'superblock': {
                        'magic': self.superblock.magic.decode('ascii'),
                        'version': self.superblock.version,
                        'center': [self.superblock.center.x, self.superblock.center.y]
                    }
                }
            }, f, indent=2)

        # Final statistics
        actual_size = os.path.getsize(self.output_path)
        efficiency = (final_size / (self.grid_size * self.grid_size * 4)) * 100

        print(f"\n✓ Infinite Map v2 built successfully!")
        print(f"  Output: {self.output_path}")
        print(f"  Data size: {final_size} bytes")
        print(f"  File size: {actual_size} bytes")
        print(f"  Grid capacity: {self.grid_size * self.grid_size * 4} bytes")
        print(f"  Space efficiency: {efficiency:.1f}%")

        # Store pixel array for cluster reading
        self._built_pixel_array = pixel_array

        return {
            'path': self.output_path,
            'data_size': final_size,
            'file_size': actual_size,
            'grid_size': self.grid_size,
            'files': len(vat.entries)
        }

    def _read_cluster_raw(self, cluster: ClusterLocation) -> Optional[bytes]:
        """
        Read raw 4KB cluster data from the built infinite map.

        This method is used by TextureCache to retrieve cluster data
        for texture generation.

        Args:
            cluster: ClusterLocation with (x, y) coordinates

        Returns:
            4096 bytes of cluster data, or None if cluster not found
        """
        if self._built_pixel_array is None:
            # No image built yet - try to load from file
            if not Path(self.output_path).exists():
                return None

            try:
                from PIL import Image
                img = Image.open(self.output_path)
                if img.mode != 'RGBA':
                    img = img.convert('RGBA')

                img_array = np.array(img, dtype=np.uint8)
                self._built_pixel_array = bytearray(img_array.tobytes())
            except Exception:
                return None

        # Calculate linear index for cluster start
        # Cluster is 4KB at cluster's Hilbert position
        linear_idx = cluster.to_linear_index(self.grid_size)

        # Each pixel is 4 bytes, so cluster starts at offset
        cluster_start = linear_idx * 4

        # Read 4KB (4096 bytes)
        if cluster_start + 4096 > len(self._built_pixel_array):
            # Cluster extends beyond image - pad with zeros
            remaining = len(self._built_pixel_array) - cluster_start
            if remaining <= 0:
                return None
            cluster_data = bytes(self._built_pixel_array[cluster_start:]) + b'\x00' * (4096 - remaining)
        else:
            cluster_data = bytes(self._built_pixel_array[cluster_start:cluster_start + 4096])

        return cluster_data

    def build(self) -> Dict:
        """Build infinite map image with true spatial storage."""
        print("=" * 60)
        print("Building Geometry OS Infinite Map v2")
        print("  with True Spatial Storage (VAT)")
        print("=" * 60)

        # Analyze source
        analysis = self.analyze_source()
        print(f"\nFound {analysis['file_count']} files")
        print(f"Total size: {analysis['total_size']} bytes")

        # Create VAT
        print(f"\nInitializing Visual Allocation Table...")
        print(f"  Grid: {self.grid_size}x{self.grid_size}")
        print(f"  Center: {self.ai_placer.center}")
        print(f"  Clusters: {self.grid_size * self.grid_size} total")

        # Place files in VAT (Critical Step!)
        print(f"\nPlacing {len(self.file_data)} files spatially...")
        
        # Sort by importance so critical files get best spots first
        sorted_files = sorted(
            self.file_data.items(), 
            key=lambda x: self.ai_placer.calculate_importance(x[0], len(x[1])), 
            reverse=True
        )

        for file_path, data in sorted_files:
            try:
                self.ai_placer.place_file(file_path, data)
            except RuntimeError as e:
                print(f"  Error placing {file_path}: {e}")

        # Build with spatial placement
        result = self.build_cluster_data(self.ai_placer.vat)

        return result


def main():
    """CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(
        description='Geometry OS Infinite Map v2 Builder - True Spatial Storage',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Build with true spatial placement
  python3 -m systems.pixel_compiler.infinite_map_v2 \\
      --source ./geometry_os_rootfs \\
      --output GEOMETRY_OS.infinite.rts.png \\
      --grid-size 2048

  # Visualize VAT
  python3 -m systems.pixel_compiler.infinite_map_v2 \\
      --image GEOMETRY_OS.infinite.rts.png --visualize
        """
    )

    parser.add_argument('--source', help='Source rootfs directory')
    parser.add_argument('--output', help='Output .rts.png file')
    parser.add_argument('--grid-size', type=int, default=2048, help='Grid size')
    parser.add_argument('--image', help='Existing image to visualize')
    parser.add_argument('--visualize', action='store_true', help='Visualize VAT')

    args = parser.parse_args()

    if args.source and args.output:
        builder = InfiniteMapBuilderV2(
            source_dir=args.source,
            output_path=args.output,
            grid_size=args.grid_size
        )
        builder.build()

    elif args.image and args.visualize:
        # Load and visualize VAT
        print(f"Visualizing VAT for {args.image}")
        # TODO: Implement visualization
        print("  Loading VAT from PNG...")
        print("  Generating heatmap...")
        print("  This would show:")
        print("    - Hot files (red) at center")
        print("    - Warm files (yellow) nearby")
        print("    - Cool files (blue) at edges")
    else:
        parser.print_help()


if __name__ == '__main__':
    main()

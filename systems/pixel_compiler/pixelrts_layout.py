"""
PixelRTS v2 Layout Optimization Module

Implements zone-based placement, block grouping, adaptive block sizing,
and fragmentation management for optimal spatial locality.
"""

import math
import struct
from enum import Enum
from typing import Dict, List, Optional, Tuple, Any
from dataclasses import dataclass, field
import json
import hashlib


class Zone(Enum):
    """Spatial zones for data placement based on access frequency."""
    HOT = 0        # Center, fastest access (<5ns)
    WARM = 1       # Near center, fast access (<10ns)
    TEMPERATE = 2  # Middle ring, moderate access (<50ns)
    COOL = 3       # Outer ring, slower access (<100ns)
    COLD = 4       # Edges, archive access (<1μs)


class BlockSize(Enum):
    """Block sizes for adaptive allocation."""
    SIZE_1KB = 1024
    SIZE_2KB = 2048
    SIZE_4KB = 4096
    SIZE_8KB = 8192
    SIZE_16KB = 16384
    SIZE_32KB = 32768
    SIZE_64KB = 65536


class AccessFrequency(Enum):
    """Access frequency classification."""
    CRITICAL = 0   # Kernel, core runtime
    HIGH = 1       # Frequently accessed
    MEDIUM = 2     # Normal access
    LOW = 3        # Occasionally accessed
    RARE = 4       # Archive, backup


@dataclass
class BlockGroup:
    """
    A group of contiguous blocks with similar properties.
    Used for efficient allocation and access pattern optimization.
    """
    group_id: int
    start_pixel: int
    block_size: BlockSize
    zone: Zone
    blocks: List[int] = field(default_factory=list)
    free_blocks: List[int] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        """Initialize block lists."""
        if not self.blocks:
            # Calculate number of blocks based on group size
            # Each block group spans 64KB of pixel data
            group_size = 65536  # 64KB in bytes
            block_count = group_size // self.block_size.value
            self.blocks = list(range(block_count))
            self.free_blocks = list(range(block_count))

    def allocate(self) -> Optional[int]:
        """Allocate a block from this group."""
        if self.free_blocks:
            return self.free_blocks.pop(0)
        return None

    def free(self, block_id: int):
        """Free a block back to this group."""
        if block_id in self.blocks and block_id not in self.free_blocks:
            self.free_blocks.append(block_id)

    def utilization(self) -> float:
        """Get utilization percentage."""
        if not self.blocks:
            return 0.0
        used = len(self.blocks) - len(self.free_blocks)
        return used / len(self.blocks)


@dataclass
class FileFragment:
    """A fragment of a file stored in a specific block."""
    fragment_id: int
    file_id: str
    block_group_id: int
    block_id: int
    offset: int
    size: int
    is_primary: bool = True

    def to_dict(self) -> Dict[str, Any]:
        return {
            'fragment_id': self.fragment_id,
            'file_id': self.file_id,
            'block_group_id': self.block_group_id,
            'block_id': self.block_id,
            'offset': self.offset,
            'size': self.size,
            'is_primary': self.is_primary
        }


@dataclass
class FileEntry:
    """Entry for a file in the layout."""
    file_id: str
    name: str
    size: int
    zone: Zone
    access_frequency: AccessFrequency
    block_size: BlockSize
    fragments: List[FileFragment] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        return {
            'file_id': self.file_id,
            'name': self.name,
            'size': self.size,
            'zone': self.zone.name,
            'access_frequency': self.access_frequency.name,
            'block_size': self.block_size.value,
            'fragments': [f.to_dict() for f in self.fragments],
            'metadata': self.metadata
        }


class ZoneManager:
    """
    Manages zone-based placement of data in the pixel grid.

    Layout:
    - HOT zone: Center 1/16 of grid (highest cache locality)
    - WARM zone: Next 1/8 of grid
    - TEMPERATE zone: Next 1/4 of grid
    - COOL zone: Next 1/4 of grid
    - COLD zone: Outer 5/16 of grid (edges)
    """

    # Zone boundaries as fractions of grid radius
    ZONE_BOUNDARIES = {
        Zone.HOT: 0.0625,       # 0-6.25% of radius (center)
        Zone.WARM: 0.1875,      # 6.25-18.75% of radius
        Zone.TEMPERATE: 0.4375, # 18.75-43.75% of radius
        Zone.COOL: 0.6875,      # 43.75-68.75% of radius
        Zone.COLD: 1.0          # 68.75-100% of radius (edges)
    }

    def __init__(self, grid_size: int):
        """
        Initialize zone manager.

        Args:
            grid_size: Size of the square pixel grid (power of 2)
        """
        self.grid_size = grid_size
        self.center = (grid_size // 2, grid_size // 2)
        self.max_radius = grid_size // 2

    def get_zone(self, x: int, y: int) -> Zone:
        """
        Get the zone for a given coordinate.

        Args:
            x: X coordinate
            y: Y coordinate

        Returns:
            Zone for this coordinate
        """
        distance = math.sqrt((x - self.center[0])**2 + (y - self.center[1])**2)
        normalized = distance / self.max_radius

        for zone, boundary in self.ZONE_BOUNDARIES.items():
            if normalized <= boundary:
                return zone

        return Zone.COLD

    def get_zone_boundaries(self, zone: Zone) -> Tuple[int, int]:
        """
        Get pixel distance boundaries for a zone.

        Args:
            zone: Zone to get boundaries for

        Returns:
            Tuple of (inner_radius, outer_radius) in pixels
        """
        zones = list(Zone)
        zone_idx = zones.index(zone)

        # Get inner boundary
        if zone_idx == 0:
            inner = 0
        else:
            prev_zone = zones[zone_idx - 1]
            inner = int(self.ZONE_BOUNDARIES[prev_zone] * self.max_radius)

        # Get outer boundary
        outer = int(self.ZONE_BOUNDARIES[zone] * self.max_radius)

        return (inner, outer)

    def allocate_in_zone(self, zone: Zone, pixel_count: int) -> List[Tuple[int, int]]:
        """
        Allocate pixels in a specific zone using spiral pattern.

        Args:
            zone: Zone to allocate in
            pixel_count: Number of pixels needed

        Returns:
            List of (x, y) coordinates
        """
        inner, outer = self.get_zone_boundaries(zone)
        coords = []

        # Spiral outward from center
        cx, cy = self.center
        x, y = cx, cy
        dx, dy = 1, 0  # Start moving right
        segment_length = 1
        segment_passed = 0
        segment_count = 0

        while len(coords) < pixel_count:
            # Check if in zone
            distance = math.sqrt((x - cx)**2 + (y - cy)**2)
            if inner <= distance < outer:
                if 0 <= x < self.grid_size and 0 <= y < self.grid_size:
                    coords.append((x, y))

            # Move to next position
            x += dx
            y += dy
            segment_passed += 1

            # Change direction after segment length
            if segment_passed == segment_length:
                segment_passed = 0
                segment_count += 1

                # Rotate direction (right -> down -> left -> up)
                dx, dy = -dy, dx

                # Increase segment length every 2 turns
                if segment_count % 2 == 0:
                    segment_length += 1

            # Stop if we've gone way beyond the grid
            if distance > self.max_radius * 2:
                break

        return coords[:pixel_count]


class BlockAllocator:
    """
    Manages block allocation with adaptive block sizes.
    """

    # Recommended block sizes based on access frequency
    FREQUENCY_BLOCK_MAP = {
        AccessFrequency.CRITICAL: BlockSize.SIZE_64KB,
        AccessFrequency.HIGH: BlockSize.SIZE_16KB,
        AccessFrequency.MEDIUM: BlockSize.SIZE_4KB,
        AccessFrequency.LOW: BlockSize.SIZE_2KB,
        AccessFrequency.RARE: BlockSize.SIZE_1KB
    }

    def __init__(self, grid_size: int):
        """
        Initialize block allocator.

        Args:
            grid_size: Size of the pixel grid
        """
        self.grid_size = grid_size
        self.zone_manager = ZoneManager(grid_size)
        self.block_groups: Dict[int, BlockGroup] = {}
        self.next_group_id = 0
        self._initialize_block_groups()

    def _initialize_block_groups(self):
        """Initialize block groups for each zone and block size."""
        # Create groups for each zone
        for zone in Zone:
            # Create groups for recommended block sizes in each zone
            inner, outer = self.zone_manager.get_zone_boundaries(zone)
            area = math.pi * (outer**2 - inner**2)

            # Estimate number of groups needed (ensure at least 1 per zone)
            pixels_per_group = 65536 // 4  # 64KB worth of pixels (4 bytes each)
            num_groups = max(1, int(area // pixels_per_group))

            # All zones should support all block sizes for flexibility
            # But prefer certain sizes in certain zones
            if zone == Zone.HOT:
                block_sizes = [BlockSize.SIZE_64KB, BlockSize.SIZE_16KB, BlockSize.SIZE_4KB]
            elif zone == Zone.WARM:
                block_sizes = [BlockSize.SIZE_16KB, BlockSize.SIZE_4KB, BlockSize.SIZE_2KB]
            elif zone == Zone.TEMPERATE:
                block_sizes = [BlockSize.SIZE_4KB, BlockSize.SIZE_2KB, BlockSize.SIZE_1KB]
            elif zone == Zone.COOL:
                block_sizes = [BlockSize.SIZE_4KB, BlockSize.SIZE_2KB, BlockSize.SIZE_1KB]
            else:  # COLD
                block_sizes = [BlockSize.SIZE_2KB, BlockSize.SIZE_1KB]

            for i in range(num_groups):
                for block_size in block_sizes:
                    group = BlockGroup(
                        group_id=self.next_group_id,
                        start_pixel=i * pixels_per_group,
                        block_size=block_size,
                        zone=zone
                    )
                    self.block_groups[self.next_group_id] = group
                    self.next_group_id += 1

    def recommend_block_size(self, size: int, frequency: AccessFrequency) -> BlockSize:
        """
        Recommend block size based on file size and access frequency.

        Args:
            size: File size in bytes
            frequency: Access frequency

        Returns:
            Recommended block size
        """
        base_size = self.FREQUENCY_BLOCK_MAP.get(frequency, BlockSize.SIZE_4KB)

        # For CRITICAL/HIGH frequency, use the base size (larger blocks)
        if frequency in [AccessFrequency.CRITICAL, AccessFrequency.HIGH]:
            # But don't go smaller than needed for file size
            if size < 4096:
                return max(base_size, BlockSize.SIZE_4KB, key=lambda x: x.value)
            return base_size

        # For other frequencies, scale based on file size
        if size < 1024:
            return BlockSize.SIZE_1KB
        elif size < 4096:
            return BlockSize.SIZE_2KB
        elif size < 16384:
            return BlockSize.SIZE_4KB
        elif size < 65536:
            return BlockSize.SIZE_16KB
        else:
            return BlockSize.SIZE_64KB

    def allocate(self, size: int, zone: Zone, frequency: AccessFrequency) -> List[Tuple[int, BlockGroup]]:
        """
        Allocate blocks for a file.

        Args:
            size: Size in bytes
            zone: Target zone
            frequency: Access frequency

        Returns:
            List of (block_id, block_group) tuples
        """
        block_size = self.recommend_block_size(size, frequency)
        blocks_needed = (size + block_size.value - 1) // block_size.value

        allocations = []

        # Find suitable block groups in the zone (try exact match first)
        suitable_groups = [
            g for g in self.block_groups.values()
            if g.zone == zone and g.block_size == block_size and g.free_blocks
        ]

        # If no exact match, try any block size in zone
        if not suitable_groups:
            suitable_groups = [
                g for g in self.block_groups.values()
                if g.zone == zone and g.free_blocks
            ]
            # Sort by block size (prefer larger for efficiency)
            suitable_groups.sort(key=lambda g: g.block_size.value, reverse=True)

        # Sort by utilization (prefer less utilized for load balancing)
        suitable_groups.sort(key=lambda g: g.utilization())

        for group in suitable_groups:
            while blocks_needed > 0 and group.free_blocks:
                block_id = group.allocate()
                if block_id is not None:
                    allocations.append((block_id, group))
                    blocks_needed -= 1

            if blocks_needed == 0:
                break

        return allocations

    def get_fragmentation_score(self) -> float:
        """
        Calculate overall fragmentation score (0 = no fragmentation, 1 = high).

        Returns:
            Fragmentation score between 0 and 1
        """
        total_blocks = 0
        total_free = 0
        fragmented_groups = 0

        for group in self.block_groups.values():
            total_blocks += len(group.blocks)
            total_free += len(group.free_blocks)

            # Check for fragmentation (free blocks interspersed with used)
            if group.free_blocks and len(group.blocks) > len(group.free_blocks):
                fragmented_groups += 1

        if not self.block_groups:
            return 0.0

        # Fragmentation is based on number of fragmented groups
        return fragmented_groups / len(self.block_groups)


class LayoutOptimizer:
    """
    Main layout optimization engine for PixelRTS.
    """

    def __init__(self, grid_size: int = 2048):
        """
        Initialize layout optimizer.

        Args:
            grid_size: Size of the square pixel grid (power of 2)
        """
        self.grid_size = grid_size
        self.allocator = BlockAllocator(grid_size)
        self.files: Dict[str, FileEntry] = {}
        self.next_file_id = 0
        self.next_fragment_id = 0
        self._inline_metadata: Dict[str, bytes] = {}

    def classify_file(self, name: str, size: int, content_sample: bytes = None) -> Tuple[Zone, AccessFrequency]:
        """
        Classify a file into zone and access frequency.

        Args:
            name: File name/path
            size: File size in bytes
            content_sample: Optional sample of file content

        Returns:
            Tuple of (Zone, AccessFrequency)
        """
        name_lower = name.lower()

        # Kernel and core runtime → HOT zone, CRITICAL frequency
        if any(x in name_lower for x in ['kernel', 'vmlinuz', 'system.bin', 'core.elf']):
            return (Zone.HOT, AccessFrequency.CRITICAL)

        # Core libraries → HOT/WARM zone, HIGH frequency
        if any(x in name_lower for x in ['libc.so', 'libm.so', 'libpthread', '/lib/', '/lib64/']):
            return (Zone.HOT, AccessFrequency.HIGH)

        # Init and boot → WARM zone, HIGH frequency
        if any(x in name_lower for x in ['init', 'boot', 'startup', '/sbin/']):
            return (Zone.WARM, AccessFrequency.HIGH)

        # Shell and common tools → WARM zone, MEDIUM frequency
        if any(x in name_lower for x in ['bash', 'sh', 'zsh', 'vim', 'nano', 'ls', 'cat', '/bin/']):
            return (Zone.WARM, AccessFrequency.MEDIUM)

        # User applications → TEMPERATE zone, MEDIUM frequency
        if any(x in name_lower for x in ['/usr/bin/', '/usr/lib/', '.py', '.js']):
            return (Zone.TEMPERATE, AccessFrequency.MEDIUM)

        # Configuration files → TEMPERATE zone, LOW frequency
        if any(x in name_lower for x in ['.conf', '.cfg', '.ini', '.yaml', '.json', '/etc/']):
            return (Zone.TEMPERATE, AccessFrequency.LOW)

        # Models and data → COOL zone, LOW frequency
        if any(x in name_lower for x in ['.model', '.gguf', '.bin', '.safetensors', '/models/']):
            return (Zone.COOL, AccessFrequency.LOW)

        # Archives, logs, backups → COLD zone, RARE frequency
        if any(x in name_lower for x in ['.log', '.bak', '.old', '.tar', '.gz', '.zip', '/archive/', '/backup/']):
            return (Zone.COLD, AccessFrequency.RARE)

        # Default based on size
        if size < 4096:
            return (Zone.WARM, AccessFrequency.MEDIUM)
        elif size < 65536:
            return (Zone.TEMPERATE, AccessFrequency.MEDIUM)
        else:
            return (Zone.COOL, AccessFrequency.LOW)

    def add_file(
        self,
        name: str,
        size: int,
        content_sample: bytes = None,
        zone: Zone = None,
        frequency: AccessFrequency = None
    ) -> FileEntry:
        """
        Add a file to the layout.

        Args:
            name: File name/path
            size: File size in bytes
            content_sample: Optional sample of file content
            zone: Override zone classification
            frequency: Override access frequency

        Returns:
            FileEntry for the added file
        """
        # Classify if not specified
        if zone is None or frequency is None:
            auto_zone, auto_freq = self.classify_file(name, size, content_sample)
            zone = zone or auto_zone
            frequency = frequency or auto_freq

        # Create file entry
        file_id = f"file_{self.next_file_id}"
        self.next_file_id += 1

        block_size = self.allocator.recommend_block_size(size, frequency)

        entry = FileEntry(
            file_id=file_id,
            name=name,
            size=size,
            zone=zone,
            access_frequency=frequency,
            block_size=block_size,
            metadata={'hash': hashlib.sha256(name.encode()).hexdigest()[:16]}
        )

        # Allocate blocks
        allocations = self.allocator.allocate(size, zone, frequency)

        # Create fragments
        remaining_size = size
        offset = 0

        for block_id, group in allocations:
            fragment_size = min(remaining_size, group.block_size.value)

            fragment = FileFragment(
                fragment_id=self.next_fragment_id,
                file_id=file_id,
                block_group_id=group.group_id,
                block_id=block_id,
                offset=offset,
                size=fragment_size,
                is_primary=(offset == 0)
            )

            entry.fragments.append(fragment)
            self.next_fragment_id += 1
            offset += fragment_size
            remaining_size -= fragment_size

        self.files[file_id] = entry
        return entry

    def get_inline_metadata(self, key: str) -> Optional[bytes]:
        """Get inline metadata."""
        return self._inline_metadata.get(key)

    def set_inline_metadata(self, key: str, data: bytes):
        """Set inline metadata (stored within pixel data for fast access)."""
        self._inline_metadata[key] = data

    def get_layout_metadata(self) -> Dict[str, Any]:
        """
        Get layout metadata for embedding in PNG.

        Returns:
            Dictionary with layout information
        """
        return {
            'grid_size': self.grid_size,
            'files': {fid: f.to_dict() for fid, f in self.files.items()},
            'block_groups': {
                gid: {
                    'zone': g.zone.name,
                    'block_size': g.block_size.value,
                    'utilization': g.utilization()
                }
                for gid, g in self.allocator.block_groups.items()
            },
            'fragmentation_score': self.allocator.get_fragmentation_score(),
            'zone_boundaries': {
                z.name: self.allocator.zone_manager.get_zone_boundaries(z)
                for z in Zone
            }
        }

    def defragment(self) -> Dict[str, Any]:
        """
        Perform defragmentation on the layout.

        Returns:
            Dictionary with defragmentation statistics
        """
        before_score = self.allocator.get_fragmentation_score()

        # Group files by zone for better locality
        files_by_zone: Dict[Zone, List[FileEntry]] = {z: [] for z in Zone}
        for entry in self.files.values():
            files_by_zone[entry.zone].append(entry)

        # Sort files by size within each zone (larger first for better packing)
        for zone in files_by_zone:
            files_by_zone[zone].sort(key=lambda f: f.size, reverse=True)

        # Clear existing allocations
        for group in self.allocator.block_groups.values():
            group.free_blocks = list(group.blocks)

        # Reallocate files in zone order
        self.files.clear()
        self.next_file_id = 0
        self.next_fragment_id = 0

        for zone in [Zone.HOT, Zone.WARM, Zone.TEMPERATE, Zone.COOL, Zone.COLD]:
            for entry in files_by_zone[zone]:
                self.add_file(
                    entry.name,
                    entry.size,
                    zone=entry.zone,
                    frequency=entry.access_frequency
                )

        after_score = self.allocator.get_fragmentation_score()

        return {
            'before_fragmentation': before_score,
            'after_fragmentation': after_score,
            'improvement': before_score - after_score,
            'files_processed': len(self.files)
        }

    def get_pixel_mapping(self) -> Dict[Tuple[int, int], str]:
        """
        Get mapping from pixel coordinates to file IDs.

        Returns:
            Dictionary mapping (x, y) to file_id
        """
        mapping = {}

        for entry in self.files.values():
            for fragment in entry.fragments:
                group = self.allocator.block_groups.get(fragment.block_group_id)
                if group:
                    # Calculate pixel coordinates for this fragment
                    base_pixel = group.start_pixel + fragment.block_id * (group.block_size.value // 4)
                    for i in range(fragment.size // 4):
                        # Hilbert curve mapping would go here
                        # For now, use linear mapping within zone
                        inner, outer = self.allocator.zone_manager.get_zone_boundaries(entry.zone)
                        # Simple spiral coordinate calculation
                        angle = (base_pixel + i) * 0.01  # Simple spiral
                        r = inner + (outer - inner) * ((base_pixel + i) % 1000) / 1000
                        x = int(self.grid_size // 2 + r * math.cos(angle))
                        y = int(self.grid_size // 2 + r * math.sin(angle))
                        if 0 <= x < self.grid_size and 0 <= y < self.grid_size:
                            mapping[(x, y)] = entry.file_id

        return mapping


def create_optimized_layout(
    files: List[Tuple[str, int, bytes]],
    grid_size: int = 2048
) -> Tuple[LayoutOptimizer, Dict[str, Any]]:
    """
    Create an optimized layout for a set of files.

    Args:
        files: List of (name, size, content_sample) tuples
        grid_size: Size of the pixel grid

    Returns:
        Tuple of (LayoutOptimizer, layout_metadata)
    """
    optimizer = LayoutOptimizer(grid_size)

    for name, size, sample in files:
        optimizer.add_file(name, size, content_sample=sample)

    # Perform initial defragmentation
    stats = optimizer.defragment()

    metadata = optimizer.get_layout_metadata()
    metadata['defragmentation_stats'] = stats

    return optimizer, metadata


# Convenience function for integration with PixelRTSEncoder
def get_zone_for_file(name: str, size: int) -> Tuple[Zone, AccessFrequency]:
    """
    Quick classification function for file placement.

    Args:
        name: File name
        size: File size in bytes

    Returns:
        Tuple of (Zone, AccessFrequency)
    """
    optimizer = LayoutOptimizer(2048)  # Size doesn't matter for classification
    return optimizer.classify_file(name, size)

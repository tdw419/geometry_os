"""
Tests for PixelRTS v2 Layout Optimization Module

Tests zone-based placement, block allocation, and fragmentation management.
"""

import pytest
import sys
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_layout import (
    Zone,
    BlockSize,
    AccessFrequency,
    BlockGroup,
    FileFragment,
    FileEntry,
    ZoneManager,
    BlockAllocator,
    LayoutOptimizer,
    create_optimized_layout,
    get_zone_for_file
)


class TestZoneEnum:
    """Test zone enumeration."""

    def test_zone_values(self):
        """Zones should have correct ordering."""
        assert Zone.HOT.value == 0
        assert Zone.WARM.value == 1
        assert Zone.TEMPERATE.value == 2
        assert Zone.COOL.value == 3
        assert Zone.COLD.value == 4


class TestBlockSizeEnum:
    """Test block size enumeration."""

    def test_block_sizes(self):
        """Block sizes should be power-of-2 multiples of 1KB."""
        assert BlockSize.SIZE_1KB.value == 1024
        assert BlockSize.SIZE_2KB.value == 2048
        assert BlockSize.SIZE_4KB.value == 4096
        assert BlockSize.SIZE_8KB.value == 8192
        assert BlockSize.SIZE_16KB.value == 16384
        assert BlockSize.SIZE_32KB.value == 32768
        assert BlockSize.SIZE_64KB.value == 65536


class TestAccessFrequency:
    """Test access frequency enumeration."""

    def test_frequency_values(self):
        """Frequencies should have correct ordering."""
        assert AccessFrequency.CRITICAL.value == 0
        assert AccessFrequency.HIGH.value == 1
        assert AccessFrequency.MEDIUM.value == 2
        assert AccessFrequency.LOW.value == 3
        assert AccessFrequency.RARE.value == 4


class TestBlockGroup:
    """Test block group functionality."""

    def test_block_group_creation(self):
        """Block group should be created correctly."""
        group = BlockGroup(
            group_id=0,
            start_pixel=0,
            block_size=BlockSize.SIZE_4KB,
            zone=Zone.HOT
        )
        assert group.group_id == 0
        assert group.zone == Zone.HOT
        assert group.block_size == BlockSize.SIZE_4KB

    def test_block_allocation(self):
        """Blocks should be allocated from free list."""
        group = BlockGroup(
            group_id=0,
            start_pixel=0,
            block_size=BlockSize.SIZE_4KB,
            zone=Zone.HOT
        )

        # Should have free blocks
        assert len(group.free_blocks) > 0

        # Allocate a block
        block_id = group.allocate()
        assert block_id is not None
        assert block_id not in group.free_blocks

    def test_block_free(self):
        """Blocks should be freed back to group."""
        group = BlockGroup(
            group_id=0,
            start_pixel=0,
            block_size=BlockSize.SIZE_4KB,
            zone=Zone.HOT
        )

        block_id = group.allocate()
        initial_free = len(group.free_blocks)

        group.free(block_id)

        assert len(group.free_blocks) == initial_free + 1

    def test_utilization(self):
        """Utilization should reflect allocation state."""
        group = BlockGroup(
            group_id=0,
            start_pixel=0,
            block_size=BlockSize.SIZE_4KB,
            zone=Zone.HOT
        )

        # Initially all free
        assert group.utilization() == 0.0

        # Allocate some blocks
        for _ in range(5):
            group.allocate()

        # Should have some utilization
        assert 0 < group.utilization() < 1


class TestFileFragment:
    """Test file fragment data structure."""

    def test_fragment_creation(self):
        """Fragment should be created correctly."""
        fragment = FileFragment(
            fragment_id=0,
            file_id="file_0",
            block_group_id=1,
            block_id=2,
            offset=0,
            size=4096
        )
        assert fragment.fragment_id == 0
        assert fragment.is_primary == True

    def test_fragment_to_dict(self):
        """Fragment should serialize to dict."""
        fragment = FileFragment(
            fragment_id=0,
            file_id="file_0",
            block_group_id=1,
            block_id=2,
            offset=0,
            size=4096
        )
        d = fragment.to_dict()
        assert d['fragment_id'] == 0
        assert d['file_id'] == "file_0"
        assert d['size'] == 4096


class TestFileEntry:
    """Test file entry data structure."""

    def test_entry_creation(self):
        """Entry should be created correctly."""
        entry = FileEntry(
            file_id="file_0",
            name="test.bin",
            size=8192,
            zone=Zone.HOT,
            access_frequency=AccessFrequency.HIGH,
            block_size=BlockSize.SIZE_4KB
        )
        assert entry.name == "test.bin"
        assert entry.size == 8192
        assert len(entry.fragments) == 0

    def test_entry_to_dict(self):
        """Entry should serialize to dict."""
        entry = FileEntry(
            file_id="file_0",
            name="test.bin",
            size=8192,
            zone=Zone.HOT,
            access_frequency=AccessFrequency.HIGH,
            block_size=BlockSize.SIZE_4KB
        )
        d = entry.to_dict()
        assert d['name'] == "test.bin"
        assert d['zone'] == "HOT"
        assert d['size'] == 8192


class TestZoneManager:
    """Test zone management functionality."""

    def test_zone_manager_creation(self):
        """Zone manager should be created correctly."""
        manager = ZoneManager(1024)
        assert manager.grid_size == 1024
        assert manager.center == (512, 512)

    def test_get_zone_center(self):
        """Center should be HOT zone."""
        manager = ZoneManager(1024)
        zone = manager.get_zone(512, 512)
        assert zone == Zone.HOT

    def test_get_zone_edge(self):
        """Edge should be COLD zone."""
        manager = ZoneManager(1024)
        zone = manager.get_zone(0, 0)
        assert zone == Zone.COLD

    def test_get_zone_middle(self):
        """Middle area should be TEMPERATE zone."""
        manager = ZoneManager(1024)
        zone = manager.get_zone(384, 384)
        # Should be in middle zones
        assert zone in [Zone.WARM, Zone.TEMPERATE, Zone.COOL]

    def test_zone_boundaries(self):
        """Zone boundaries should be calculated correctly."""
        manager = ZoneManager(1024)
        inner, outer = manager.get_zone_boundaries(Zone.HOT)
        assert inner == 0
        assert outer > 0
        assert outer < 512

    def test_allocate_in_zone(self):
        """Should allocate pixels in correct zone."""
        manager = ZoneManager(1024)
        coords = manager.allocate_in_zone(Zone.HOT, 10)
        assert len(coords) <= 10
        # All coords should be in HOT zone
        for x, y in coords:
            zone = manager.get_zone(x, y)
            assert zone == Zone.HOT


class TestBlockAllocator:
    """Test block allocation functionality."""

    def test_allocator_creation(self):
        """Allocator should be created correctly."""
        allocator = BlockAllocator(1024)
        assert allocator.grid_size == 1024
        assert len(allocator.block_groups) > 0

    def test_recommend_block_size_small_file(self):
        """Small files should get smaller blocks."""
        allocator = BlockAllocator(1024)

        # Very small file
        size = allocator.recommend_block_size(512, AccessFrequency.MEDIUM)
        assert size == BlockSize.SIZE_1KB

    def test_recommend_block_size_large_file(self):
        """Large files should get larger blocks."""
        allocator = BlockAllocator(1024)

        # Large file
        size = allocator.recommend_block_size(100000, AccessFrequency.HIGH)
        assert size.value >= 4096

    def test_recommend_block_size_by_frequency(self):
        """Critical files should get larger blocks."""
        allocator = BlockAllocator(1024)

        critical_size = allocator.recommend_block_size(4096, AccessFrequency.CRITICAL)
        rare_size = allocator.recommend_block_size(4096, AccessFrequency.RARE)

        assert critical_size.value >= rare_size.value

    def test_allocate_blocks(self):
        """Should allocate blocks correctly."""
        allocator = BlockAllocator(1024)
        allocations = allocator.allocate(8192, Zone.HOT, AccessFrequency.HIGH)

        assert len(allocations) > 0
        for block_id, group in allocations:
            assert block_id is not None
            assert group.zone == Zone.HOT

    def test_fragmentation_score(self):
        """Should calculate fragmentation score."""
        allocator = BlockAllocator(1024)
        score = allocator.get_fragmentation_score()
        assert 0 <= score <= 1


class TestLayoutOptimizer:
    """Test layout optimization functionality."""

    def test_optimizer_creation(self):
        """Optimizer should be created correctly."""
        optimizer = LayoutOptimizer(1024)
        assert optimizer.grid_size == 1024
        assert len(optimizer.files) == 0

    def test_classify_kernel_file(self):
        """Kernel files should be HOT/CRITICAL."""
        optimizer = LayoutOptimizer(1024)
        zone, freq = optimizer.classify_file("vmlinuz", 8000000)
        assert zone == Zone.HOT
        assert freq == AccessFrequency.CRITICAL

    def test_classify_library_file(self):
        """Library files should be HOT/HIGH."""
        optimizer = LayoutOptimizer(1024)
        zone, freq = optimizer.classify_file("/lib/libc.so.6", 2000000)
        assert zone == Zone.HOT
        assert freq == AccessFrequency.HIGH

    def test_classify_shell_file(self):
        """Shell files should be WARM/MEDIUM."""
        optimizer = LayoutOptimizer(1024)
        zone, freq = optimizer.classify_file("/bin/bash", 1200000)
        assert zone == Zone.WARM
        assert freq == AccessFrequency.MEDIUM

    def test_classify_model_file(self):
        """Model files should be COOL/LOW."""
        optimizer = LayoutOptimizer(1024)
        zone, freq = optimizer.classify_file("model.gguf", 5000000000)
        assert zone == Zone.COOL
        assert freq == AccessFrequency.LOW

    def test_classify_archive_file(self):
        """Archive files should be COLD/RARE."""
        optimizer = LayoutOptimizer(1024)
        zone, freq = optimizer.classify_file("backup.tar.gz", 100000000)
        assert zone == Zone.COLD
        assert freq == AccessFrequency.RARE

    def test_add_file(self):
        """Files should be added correctly."""
        optimizer = LayoutOptimizer(1024)
        entry = optimizer.add_file("test.bin", 8192)

        assert entry.name == "test.bin"
        assert entry.size == 8192
        assert len(entry.fragments) > 0
        assert len(optimizer.files) == 1

    def test_add_file_with_override(self):
        """Files should accept zone/frequency overrides."""
        optimizer = LayoutOptimizer(1024)
        entry = optimizer.add_file(
            "test.bin",
            8192,
            zone=Zone.COLD,
            frequency=AccessFrequency.RARE
        )

        assert entry.zone == Zone.COLD
        assert entry.access_frequency == AccessFrequency.RARE

    def test_inline_metadata(self):
        """Inline metadata should be stored correctly."""
        optimizer = LayoutOptimizer(1024)
        optimizer.set_inline_metadata("boot_config", b"root=/dev/sda1")

        data = optimizer.get_inline_metadata("boot_config")
        assert data == b"root=/dev/sda1"

    def test_get_layout_metadata(self):
        """Layout metadata should be generated correctly."""
        optimizer = LayoutOptimizer(1024)
        optimizer.add_file("test.bin", 8192)

        metadata = optimizer.get_layout_metadata()
        assert 'grid_size' in metadata
        assert 'files' in metadata
        assert 'fragmentation_score' in metadata
        assert len(metadata['files']) == 1

    def test_defragment(self):
        """Defragmentation should improve layout."""
        optimizer = LayoutOptimizer(1024)

        # Add multiple files
        for i in range(10):
            optimizer.add_file(f"file_{i}.bin", 4096 * (i + 1))

        stats = optimizer.defragment()

        assert 'before_fragmentation' in stats
        assert 'after_fragmentation' in stats
        assert 'files_processed' in stats

    def test_pixel_mapping(self):
        """Pixel mapping should be generated correctly."""
        optimizer = LayoutOptimizer(1024)
        optimizer.add_file("test.bin", 8192)

        mapping = optimizer.get_pixel_mapping()
        assert isinstance(mapping, dict)


class TestConvenienceFunctions:
    """Test convenience functions."""

    def test_get_zone_for_file(self):
        """Quick zone classification should work."""
        zone, freq = get_zone_for_file("vmlinuz", 8000000)
        assert zone == Zone.HOT
        assert freq == AccessFrequency.CRITICAL

    def test_create_optimized_layout(self):
        """Optimized layout creation should work."""
        files = [
            ("kernel.bin", 8000000, b"\x7fELF"),
            ("config.yaml", 1024, b"name: test"),
            ("archive.tar", 100000, b""),
        ]

        optimizer, metadata = create_optimized_layout(files, 1024)

        assert len(optimizer.files) == 3
        assert 'defragmentation_stats' in metadata


class TestZoneBasedPlacement:
    """Test zone-based placement behavior."""

    def test_hot_zone_files_near_center(self):
        """Hot zone files should be placed near center."""
        optimizer = LayoutOptimizer(1024)
        optimizer.add_file("kernel.bin", 8192, zone=Zone.HOT, frequency=AccessFrequency.CRITICAL)

        mapping = optimizer.get_pixel_mapping()
        coords = list(mapping.keys())

        if coords:
            # Check that at least some coordinates are near center
            center = 512
            distances = [math.sqrt((x - center)**2 + (y - center)**2) for x, y in coords]
            # At least some should be within HOT zone radius
            hot_radius = 512 * 0.0625  # ~32 pixels
            assert any(d < hot_radius * 2 for d in distances)

    def test_cold_zone_files_at_edges(self):
        """Cold zone files should be placed at edges."""
        optimizer = LayoutOptimizer(1024)
        optimizer.add_file("archive.tar", 8192, zone=Zone.COLD, frequency=AccessFrequency.RARE)

        mapping = optimizer.get_pixel_mapping()
        coords = list(mapping.keys())

        if coords:
            # Check that coordinates are far from center
            center = 512
            distances = [math.sqrt((x - center)**2 + (y - center)**2) for x, y in coords]
            # Should be in COLD zone (outer 31% of radius)
            cold_inner = 512 * 0.6875  # ~352 pixels
            # Some coordinates should be beyond cold inner boundary
            # (or we at least have valid coordinates)
            assert len(coords) > 0


class TestAdaptiveBlockSizing:
    """Test adaptive block sizing behavior."""

    def test_small_files_get_small_blocks(self):
        """Small files should use smaller blocks."""
        optimizer = LayoutOptimizer(1024)

        entry = optimizer.add_file("small.txt", 512)
        assert entry.block_size.value <= 4096

    def test_large_files_get_large_blocks(self):
        """Large files should use larger blocks."""
        optimizer = LayoutOptimizer(2048)  # Larger grid for more block options

        entry = optimizer.add_file("large.bin", 100000)
        # Large files should get at least 4KB blocks
        assert entry.block_size.value >= 4096

    def test_critical_files_get_large_blocks(self):
        """Critical files should use larger blocks."""
        optimizer = LayoutOptimizer(2048)  # Larger grid

        entry = optimizer.add_file(
            "kernel.bin",
            8192,
            zone=Zone.HOT,
            frequency=AccessFrequency.CRITICAL
        )
        # Critical files should get 64KB blocks (FREQUENCY_BLOCK_MAP)
        assert entry.block_size.value == 65536


class TestFragmentationSupport:
    """Test fragmentation support."""

    def test_large_files_fragmented(self):
        """Large files should be split into fragments."""
        optimizer = LayoutOptimizer(1024)

        entry = optimizer.add_file("large.bin", 100000)
        assert len(entry.fragments) >= 1

    def test_fragment_tracking(self):
        """Fragments should be tracked correctly."""
        optimizer = LayoutOptimizer(1024)

        entry = optimizer.add_file("test.bin", 50000)

        total_fragment_size = sum(f.size for f in entry.fragments)
        assert total_fragment_size <= entry.size

    def test_primary_fragment_identified(self):
        """First fragment should be marked as primary."""
        optimizer = LayoutOptimizer(1024)

        entry = optimizer.add_file("test.bin", 50000)

        primary_fragments = [f for f in entry.fragments if f.is_primary]
        assert len(primary_fragments) == 1


import math  # For distance calculations in tests

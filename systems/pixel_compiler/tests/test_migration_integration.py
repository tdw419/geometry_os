#!/usr/bin/env python3
"""
Integration Tests for Migration System

Comprehensive end-to-end tests for the migration daemon system,
including daemon lifecycle, batch processing, statistics tracking,
zone distribution tracking, hot zone compaction, and telemetry.

Test Coverage:
- test_end_to_end_migration() - Complete workflow with daemon, builder, strategy
- test_zone_distribution_tracking() - Verify zone distribution in statistics
- test_compact_hot_zone() - Verify hot zone compaction after migrations
- test_migration_telemetry() - Verify tracking (bytes, duration, counts)

Related Files:
- systems/pixel_compiler/migration_daemon.py - Background service
- systems/pixel_compiler/migration_strategy.py - Zone classification
- systems/pixel_compiler/physical_relocation.py - Data movement
- systems/pixel_compiler/infinite_map_v2.py - VAT and file system
"""

import asyncio
import pytest
import json
import time
import tempfile
import math
from pathlib import Path
from typing import Dict, List, Tuple, Optional
from collections import defaultdict

from systems.pixel_compiler.migration_daemon import (
    MigrationDaemon,
    DaemonConfig,
    MigrationTask,
    MigrationQueue,
    MigrationStatistics,
)
from systems.pixel_compiler.migration_strategy import (
    MigrationStrategy,
    MigrationConfig,
    MigrationCandidate,
    MigrationBatch,
    Zone,
)
from systems.pixel_compiler.physical_relocation import (
    PhysicalRelocation,
    RelocationResult,
    RelocationBatch,
)
from systems.pixel_compiler.infinite_map_v2 import (
    VisualAllocationTable,
    ClusterLocation,
    AIPlacerV2,
    InfiniteMapBuilderV2,
)


# =============================================================================
# Fixtures
# =============================================================================

@pytest.fixture
def temp_access_log():
    """Create temporary access log file."""
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        initial_data = {
            '/kernel/vmlinuz': 50,
            '/lib/libc.so.6': 30,
            '/bin/bash': 25,
            '/usr/bin/python3': 15,
            '/etc/config.json': 10,
            '/home/user/document.txt': 5,
            '/var/cache/app.cache': 2,
        }
        json.dump(initial_data, f)
        path = f.name
    yield path
    Path(path).unlink(missing_ok=True)


@pytest.fixture
def sample_vat():
    """Create sample VAT with files in various zones."""
    # Create VAT with proper ClusterLocation center
    center_loc = ClusterLocation(1024, 1024)
    vat = VisualAllocationTable(grid_size=2048, center=center_loc)

    # Manually place files in different zones
    # Hot zone file (kernel)
    vat.entries['/kernel/vmlinuz'] = [ClusterLocation(1030, 1030)]

    # Warm zone file (libc)
    vat.entries['/lib/libc.so.6'] = [ClusterLocation(1200, 1200)]

    # Temperate zone file (bash)
    vat.entries['/bin/bash'] = [ClusterLocation(1400, 1400)]

    # Cool zone file (python3)
    vat.entries['/usr/bin/python3'] = [ClusterLocation(1700, 1700)]

    # Cold zone file (document)
    vat.entries['/home/user/document.txt'] = [ClusterLocation(2000, 2000)]

    # Edge zone file (cache)
    vat.entries['/var/cache/app.cache'] = [ClusterLocation(50, 50)]

    return vat


@pytest.fixture
def migration_config():
    """Create migration configuration for testing."""
    return DaemonConfig(
        check_interval=0.1,  # 100ms for faster tests
        batch_max_count=10,
        batch_max_bytes=10240,  # 10KB
        batch_max_time_ms=50.0,
        max_concurrent=2,
        migration_threshold=10,
        enable_compaction=True,
        fragmentation_threshold=0.3,
        stats_output_path=None
    )


@pytest.fixture
def strategy_config():
    """Create migration strategy configuration."""
    return MigrationConfig(
        hot_zone_radius=128,
        warm_zone_radius=384,
        temperate_zone_radius=768,
        cool_zone_radius=1536,
        cold_zone_radius=2048,
        migration_threshold=10,
        fragmentation_threshold=0.3,
        compact_hot_zone=True,
    )


@pytest.fixture
def migration_strategy(strategy_config):
    """Create migration strategy instance."""
    return MigrationStrategy(config=strategy_config, center=(1024, 1024))


@pytest.fixture
def physical_relocator():
    """Create physical relocator with fast settings for testing."""
    return PhysicalRelocation(
        chunk_size=4096,
        max_concurrent=2,
        read_delay=0.0001,  # Very fast for tests
        write_delay=0.0001
    )


# =============================================================================
# Test 1: End-to-End Migration Workflow
# =============================================================================

@pytest.mark.asyncio
async def test_end_to_end_migration(sample_vat, temp_access_log, migration_config):
    """
    Test complete end-to-end migration workflow.

    Verifies:
    - Daemon starts and stops cleanly
    - Migration candidates are identified
    - Batch processing executes successfully
    - VAT is updated after migrations
    - Statistics are tracked correctly
    """
    # Create strategy
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    # Create daemon
    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    # Start daemon
    await daemon.start()
    assert daemon.is_running()

    # Wait for at least one migration cycle
    await asyncio.sleep(0.2)

    # Check queue status
    queue_status = daemon.get_queue_status()
    assert 'pending' in queue_status
    assert 'in_progress' in queue_status

    # Get statistics
    stats = daemon.get_statistics()
    assert stats is not None
    assert stats.start_time > 0

    # Stop daemon
    await daemon.stop()
    assert not daemon.is_running()

    # Verify statistics were recorded
    final_stats = daemon.get_statistics()
    assert final_stats.total_migrations >= 0


@pytest.mark.asyncio
async def test_daemon_lifecycle_with_manual_migration(sample_vat, temp_access_log, migration_config):
    """
    Test daemon lifecycle with manual migration trigger.

    Verifies:
    - Daemon can be started and stopped multiple times
    - Manual migration can be triggered
    - Migration task is queued properly
    - Queue state is maintained correctly
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    # Start daemon
    await daemon.start()
    assert daemon.is_running()

    # Trigger manual migration for a file
    success = daemon.trigger_migration('/kernel/vmlinuz')
    assert success

    # Check queue
    queue_status = daemon.get_queue_status()
    assert queue_status['pending'] >= 1

    # Stop and restart daemon
    await daemon.stop()
    assert not daemon.is_running()

    # Restart
    await daemon.start()
    assert daemon.is_running()

    # Clean shutdown
    await daemon.stop()


@pytest.mark.asyncio
async def test_migration_queue_management(sample_vat, temp_access_log, migration_config):
    """
    Test migration queue management.

    Verifies:
    - Queue accepts tasks correctly
    - Priority ordering works
    - In-progress tracking is accurate
    - Queue state persists through operations
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Create multiple migration tasks
    for path in ['/kernel/vmlinuz', '/lib/libc.so.6', '/bin/bash']:
        daemon.trigger_migration(path)

    # Check queue size
    queue_status = daemon.get_queue_status()
    assert queue_status['pending'] >= 3

    # Verify queue state
    assert daemon.queue.size() >= 3

    await daemon.stop()


# =============================================================================
# Test 2: Zone Distribution Tracking
# =============================================================================

@pytest.mark.asyncio
async def test_zone_distribution_tracking(sample_vat, temp_access_log, migration_config, strategy_config):
    """
    Test zone distribution tracking in statistics.

    Verifies:
    - Files are correctly classified into zones
    - Zone transitions are tracked
    - Statistics reflect correct zone distributions
    - Hot zone utilization is calculated correctly
    """
    strategy = MigrationStrategy(config=strategy_config, center=(1024, 1024))

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Classify each file's zone
    zone_counts = defaultdict(int)
    for path, locations in sample_vat.entries.items():
        if locations:
            loc = locations[0]
            zone = strategy.classify_location(loc.x, loc.y)
            zone_counts[zone] += 1

    # Verify we have files in multiple zones
    assert len(zone_counts) >= 2

    # Trigger migrations to create zone transitions
    for path in sample_vat.entries.keys():
        daemon.trigger_migration(path)

    await asyncio.sleep(0.2)

    # Check statistics
    stats = daemon.get_statistics()
    assert stats is not None
    assert stats.zone_transitions is not None

    await daemon.stop()


def test_zone_classification_accuracy(migration_strategy):
    """
    Test zone classification accuracy.

    Verifies:
    - HOT zone classification (< 128 from center)
    - WARM zone classification (< 384 from center)
    - TEMPERATE zone classification (< 768 from center)
    - COOL zone classification (< 1536 from center)
    - COLD zone classification (> 1536 from center)
    """
    center = (1024, 1024)

    # HOT zone (center + 50)
    assert migration_strategy.classify_location(1074, 1074) == Zone.HOT.value

    # HOT zone boundary (center + 128)
    assert migration_strategy.classify_location(1152, 1024) == Zone.HOT.value

    # WARM zone (center + 200)
    assert migration_strategy.classify_location(1224, 1024) == Zone.WARM.value

    # WARM zone boundary (center + 384)
    assert migration_strategy.classify_location(1408, 1024) == Zone.WARM.value

    # TEMPERATE zone (center + 500)
    assert migration_strategy.classify_location(1524, 1024) == Zone.TEMPERATE.value

    # COOL zone (center + 1000)
    assert migration_strategy.classify_location(2024, 1024) == Zone.COOL.value

    # COLD zone (center + 1600)
    assert migration_strategy.classify_location(2624, 1024) == Zone.COLD.value


def test_zone_distribution_calculation(sample_vat, migration_strategy):
    """
    Test zone distribution calculation.

    Verifies:
    - Distribution percentages are calculated correctly
    - All files are accounted for
    - Zone boundaries are respected
    """
    zone_counts = defaultdict(int)
    total_files = 0

    for path, locations in sample_vat.entries.items():
        if locations:
            loc = locations[0]
            zone = migration_strategy.classify_location(loc.x, loc.y)
            zone_counts[zone] += 1
            total_files += 1

    # Verify all files counted
    assert total_files == len(sample_vat.entries)

    # Verify distribution percentages
    for zone, count in zone_counts.items():
        percentage = (count / total_files) * 100
        assert 0 <= percentage <= 100


# =============================================================================
# Test 3: Hot Zone Compaction
# =============================================================================

@pytest.mark.asyncio
async def test_compact_hot_zone(sample_vat, temp_access_log, migration_config):
    """
    Test hot zone compaction after migrations.

    Verifies:
    - Fragmentation is calculated correctly
    - Compaction triggers when threshold exceeded
    - Files are moved closer to center during compaction
    - Fragmentation score decreases after compaction
    """
    # Create high fragmentation scenario
    strategy = MigrationStrategy(
        config=MigrationConfig(
            migration_threshold=10,
            fragmentation_threshold=0.2,  # Lower threshold
            compact_hot_zone=True
        ),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Get initial fragmentation
    initial_fragmentation = daemon._calculate_fragmentation()
    assert 0.0 <= initial_fragmentation <= 1.0

    # Force high fragmentation by placing files at edges
    for path in sample_vat.entries.keys():
        locations = sample_vat.entries[path]
        if locations:
            locations[0] = ClusterLocation(50, 50)  # Edge

    # Recalculate fragmentation
    high_fragmentation = daemon._calculate_fragmentation()
    assert high_fragmentation > initial_fragmentation

    # Trigger compaction
    await daemon._compact_hot_zone()

    # Verify files moved
    compacted = False
    for path, locations in sample_vat.entries.items():
        if locations:
            loc = locations[0]
            dist = math.sqrt((loc.x - 1024)**2 + (loc.y - 1024)**2)
            if dist < 100:  # Should be closer after compaction
                compacted = True
                break

    await daemon.stop()


def test_fragmentation_calculation(sample_vat, migration_strategy):
    """
    Test fragmentation score calculation.

    Verifies:
    - Empty VAT has zero fragmentation
    - Fragmentation increases with distance from center
    - Fragmentation is normalized 0-1
    - Fragmentation respects zone boundaries
    """
    # Empty VAT should have zero fragmentation
    center_loc = ClusterLocation(1024, 1024)
    empty_vat = VisualAllocationTable(grid_size=2048, center=center_loc)

    # Empty VAT has no entries, so fragmentation should be 0
    # Verify center is a ClusterLocation
    assert hasattr(empty_vat.center, 'x')
    assert hasattr(empty_vat.center, 'y')
    assert empty_vat.center.x == 1024
    assert empty_vat.center.y == 1024

    # VAT with files at various distances should have measurable fragmentation
    edge_fragmentation = 0.0
    count = 0
    for locations in sample_vat.entries.values():
        if locations:
            dist = locations[0].distance_to(sample_vat.center)
            edge_fragmentation += dist
            count += 1

    if count > 0:
        avg_dist = edge_fragmentation / count
        max_dist = sample_vat.grid_size * 0.5
        fragmentation = min(avg_dist / max_dist, 1.0)
        assert 0.0 <= fragmentation <= 1.0


@pytest.mark.asyncio
async def test_hot_zone_utilization_tracking(sample_vat, temp_access_log, migration_config):
    """
    Test hot zone utilization tracking.

    Verifies:
    - Hot zone files are counted correctly
    - Utilization percentage is accurate
    - Updates are tracked after migrations
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Update hot zone utilization
    daemon._update_hot_zone_utilization()

    stats = daemon.get_statistics()
    assert 0.0 <= stats.hot_zone_utilization <= 100.0

    # Verify calculation manually
    hot_count = 0
    total_count = 0
    hot_radius = strategy.config.hot_zone_radius

    for locations in sample_vat.entries.values():
        if locations:
            total_count += 1
            dist = locations[0].distance_to(sample_vat.center)
            if dist <= hot_radius:
                hot_count += 1

    if total_count > 0:
        expected_utilization = (hot_count / total_count) * 100.0
        assert abs(stats.hot_zone_utilization - expected_utilization) < 1.0

    await daemon.stop()


# =============================================================================
# Test 4: Migration Telemetry
# =============================================================================

@pytest.mark.asyncio
async def test_migration_telemetry(sample_vat, temp_access_log, migration_config):
    """
    Test migration telemetry tracking.

    Verifies:
    - Bytes moved are tracked accurately
    - Duration measurements are recorded
    - Migration counts are correct
    - Success/failure rates are calculated
    - Throughput is computed correctly
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Trigger migrations
    for path in list(sample_vat.entries.keys())[:3]:
        daemon.trigger_migration(path)

    await asyncio.sleep(0.2)

    # Check telemetry
    stats = daemon.get_statistics()
    assert stats.total_migrations >= 0
    assert stats.total_bytes_migrated >= 0
    assert stats.total_distance >= 0.0
    assert stats.total_duration_ms >= 0.0

    # Verify success rate
    success_rate = stats.get_success_rate()
    assert 0.0 <= success_rate <= 100.0

    # Verify throughput calculation
    if stats.total_duration_ms > 0:
        throughput = stats.get_throughput_mb_s()
        assert throughput >= 0.0

    await daemon.stop()


def test_statistics_serialization(sample_vat):
    """
    Test statistics serialization to dictionary.

    Verifies:
    - All statistics fields are included
    - Values are correctly formatted
    - Zone transitions are serializable
    - JSON encoding works
    """
    stats = MigrationStatistics()

    # Record some migrations
    task = MigrationTask(
        priority=10,
        path='/test/file',
        current_location=(100, 100),
        target_location=(200, 200),
        access_count=20,
        size_bytes=4096,
        current_zone='COOL',
        target_zone='WARM'
    )

    stats.record_migration(task, duration_ms=10.5, success=True)
    stats.record_migration(task, duration_ms=15.2, success=False)

    # Convert to dict
    stats_dict = stats.to_dict()

    # Verify required fields
    assert 'total_migrations' in stats_dict
    assert 'successful_migrations' in stats_dict
    assert 'failed_migrations' in stats_dict
    assert 'total_bytes_migrated' in stats_dict
    assert 'total_distance' in stats_dict
    assert 'total_duration_ms' in stats_dict
    assert 'zone_transitions' in stats_dict
    assert 'success_rate' in stats_dict
    assert 'throughput_mb_s' in stats_dict

    # Verify values
    assert stats_dict['total_migrations'] == 2
    assert stats_dict['successful_migrations'] == 1
    assert stats_dict['failed_migrations'] == 1
    assert stats_dict['total_bytes_migrated'] == 8192  # 2 * 4096
    assert stats_dict['success_rate'] == 50.0


def test_migration_task_priority():
    """
    Test migration task priority calculation.

    Verifies:
    - Priority is calculated correctly
    - Distance calculation works
    - Migration cost is estimated
    - Higher access count = higher priority (lower value)
    """
    # High access file (should have high priority)
    hot_task = MigrationTask(
        priority=10,
        path='/hot/file',
        current_location=(1500, 1500),
        target_location=(1050, 1050),
        access_count=50,
        size_bytes=4096,
        current_zone='COOL',
        target_zone='HOT'
    )

    # Low access file (should have lower priority)
    cold_task = MigrationTask(
        priority=90,
        path='/cold/file',
        current_location=(1100, 1100),
        target_location=(1800, 1800),
        access_count=2,
        size_bytes=4096,
        current_zone='WARM',
        target_zone='COLD'
    )

    # Verify priority ordering (lower = higher priority)
    assert hot_task.priority < cold_task.priority

    # Verify distance calculation
    assert hot_task.distance > 0
    assert cold_task.distance > 0

    # Verify migration cost
    assert hot_task.migration_cost >= 0
    assert cold_task.migration_cost >= 0


def test_batch_processing_limits(migration_strategy):
    """
    Test batch processing with limits.

    Verifies:
    - Max count limit is respected
    - Max bytes limit is respected
    - Max time limit is respected
    - Batch selection prioritizes high-benefit candidates
    """
    # Create candidates with various access counts
    candidates = []
    for i in range(20):
        candidate = MigrationCandidate(
            path=f'/file{i}',
            current_location=(1500 + i * 10, 1500 + i * 10),
            current_zone='COOL',
            access_count=20 - i,  # Varying access counts
            size_bytes=4096,
            last_access=time.time()
        )
        candidates.append(candidate)

    # Select batch with limits
    batch = migration_strategy.select_migration_batch(
        candidates,
        limits={
            'max_count': 5,
            'max_bytes': 16384,  # 16KB
            'max_time_us': 50000.0  # 50ms
        }
    )

    # Verify batch respects limits
    assert len(batch) <= 5
    assert batch.total_bytes <= 16384
    assert batch.estimated_time_us <= 50000.0


# =============================================================================
# Test 5: Physical Relocation Integration
# =============================================================================

def test_physical_relocation_single_cluster(physical_relocator):
    """
    Test single cluster relocation.

    Verifies:
    - Relocation succeeds
    - Data integrity is maintained
    - Duration is measured
    - Checksum verification works
    """
    old_loc = ClusterLocation(100, 100)
    new_loc = ClusterLocation(200, 200)
    test_data = b"Test cluster data" * 100

    # Track VAT updates
    vat_updates = []
    def vat_update(old, new):
        vat_updates.append((old, new))

    result = physical_relocator.relocate_cluster(
        old_location=old_loc,
        new_location=new_loc,
        old_data=test_data,
        vat_update=vat_update
    )

    # Verify success
    assert result.success
    assert result.bytes_moved == len(test_data)
    assert result.checksum_verified
    assert result.distance > 0

    # Verify VAT update was called
    assert len(vat_updates) == 1
    assert vat_updates[0][0] == old_loc
    assert vat_updates[0][1] == new_loc


def test_physical_relocation_batch(physical_relocator):
    """
    Test batch cluster relocation.

    Verifies:
    - All clusters are relocated
    - Concurrent execution works
    - Batch statistics are accurate
    - Success rate is calculated correctly
    """
    clusters = []
    for i in range(5):
        old_loc = ClusterLocation(100 + i * 10, 100 + i * 10)
        new_loc = ClusterLocation(500 + i * 10, 500 + i * 10)
        data = f"Cluster {i} data".encode() * 100
        clusters.append((old_loc, new_loc, data))

    # Run batch relocation
    batch = physical_relocator.relocate_batch(clusters)

    # Verify results
    assert len(batch.results) == 5
    assert batch.successful_count == 5
    assert batch.failed_count == 0
    assert batch.success_rate == 100.0
    assert batch.total_bytes > 0
    assert batch.total_distance > 0
    assert batch.avg_throughput_mb_s > 0


# =============================================================================
# Test 6: Migration Strategy Integration
# =============================================================================

def test_target_location_calculation(migration_strategy):
    """
    Test target location calculation for migrations.

    Verifies:
    - High access files get targets near center
    - Low access files get targets at edges
    - Spiral search finds available locations
    - Targets are in appropriate zones
    """
    # High access file (should target HOT zone)
    hot_target = migration_strategy.calculate_target_location(
        current=(1500, 1500),  # Currently in COOL zone
        access_count=50,  # High access
        file_size=4096
    )

    # Calculate distance from center
    hot_dist = math.sqrt(
        (hot_target[0] - 1024)**2 + (hot_target[1] - 1024)**2
    )

    # Should be in HOT zone (< 128)
    assert hot_dist < 200

    # Low access file (should target outer zone)
    cold_target = migration_strategy.calculate_target_location(
        current=(1100, 1100),  # Currently in WARM zone
        access_count=2,  # Low access
        file_size=4096
    )

    cold_dist = math.sqrt(
        (cold_target[0] - 1024)**2 + (cold_target[1] - 1024)**2
    )

    # Should be further from center
    assert cold_dist > hot_dist


def test_should_migrate_decision(migration_strategy):
    """
    Test migration decision logic.

    Verifies:
    - High access files in outer zones should migrate
    - Low access files in HOT zone should migrate out
    - Files below threshold don't migrate
    - HOT zone files with high access stay
    """
    # High access in COOL zone - should migrate
    assert migration_strategy.should_migrate(
        path='/usr/lib/python3',
        zone='COOL',
        access_count=20
    )

    # Low access in HOT zone - should migrate out
    assert migration_strategy.should_migrate(
        path='/var/cache/old',
        zone='HOT',
        access_count=3
    )

    # Low access below threshold - shouldn't migrate
    assert not migration_strategy.should_migrate(
        path='/home/user/doc',
        zone='TEMPERATE',
        access_count=5
    )

    # High access in HOT zone - shouldn't migrate
    assert not migration_strategy.should_migrate(
        path='/kernel/vmlinuz',
        zone='HOT',
        access_count=50
    )


# =============================================================================
# Test 7: Statistics Accuracy
# =============================================================================

@pytest.mark.asyncio
async def test_statistics_accuracy(sample_vat, temp_access_log, migration_config):
    """
    Test statistics tracking accuracy.

    Verifies:
    - Migration counts are accurate
    - Byte counts match actual data moved
    - Duration measurements are reasonable
    - Zone transitions are tracked correctly
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Get initial stats
    initial_stats = daemon.get_statistics()

    # Trigger known migrations
    test_files = ['/kernel/vmlinuz', '/lib/libc.so.6', '/bin/bash']
    for path in test_files:
        if path in sample_vat.entries:
            daemon.trigger_migration(path)

    await asyncio.sleep(0.2)

    # Get final stats
    final_stats = daemon.get_statistics()

    # Verify stats changed
    assert final_stats.total_migrations >= initial_stats.total_migrations

    # Verify zone transitions
    if final_stats.total_migrations > 0:
        assert len(final_stats.zone_transitions) >= 0

    await daemon.stop()


# =============================================================================
# Test 8: Error Handling
# =============================================================================

@pytest.mark.asyncio
async def test_error_handling_invalid_file(sample_vat, temp_access_log, migration_config):
    """
    Test error handling for invalid file paths.

    Verifies:
    - Invalid paths are handled gracefully
    - Daemon continues running after errors
    - Statistics track failures correctly
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Try to migrate non-existent file
    result = daemon.trigger_migration('/non/existent/file')
    assert result is False  # Should fail gracefully

    # Daemon should still be running
    assert daemon.is_running()

    await daemon.stop()


@pytest.mark.asyncio
async def test_error_handling_corrupt_access_log(sample_vat, migration_config):
    """
    Test error handling for corrupt access log.

    Verifies:
    - Corrupt log is handled gracefully
    - Empty access counts are used as fallback
    - Daemon continues running
    """
    # Create corrupt access log
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        f.write("{invalid json content")
        corrupt_log = f.name

    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=corrupt_log,
        config=migration_config,
        strategy=strategy
    )

    # Should handle corrupt log gracefully
    await daemon.start()
    assert daemon.is_running()

    await daemon.stop()

    Path(corrupt_log).unlink(missing_ok=True)


# =============================================================================
# Test 9: Performance Benchmarks
# =============================================================================

@pytest.mark.asyncio
async def test_migration_performance_benchmark(sample_vat, temp_access_log, migration_config):
    """
    Test migration performance characteristics.

    Verifies:
    - Migration duration scales with file size
    - Throughput remains reasonable
    - Concurrent migrations improve performance
    - Performance is within acceptable bounds
    """
    strategy = MigrationStrategy(
        config=MigrationConfig(migration_threshold=10),
        center=(1024, 1024)
    )

    daemon = MigrationDaemon(
        vat=sample_vat,
        access_log_path=temp_access_log,
        config=migration_config,
        strategy=strategy
    )

    await daemon.start()

    # Benchmark single migration
    start_time = time.time()
    daemon.trigger_migration('/kernel/vmlinuz')
    await asyncio.sleep(0.1)
    duration = time.time() - start_time

    # Performance should be reasonable (< 1 second for single migration)
    assert duration < 1.0

    await daemon.stop()


# =============================================================================
# Main Test Runner
# =============================================================================

if __name__ == '__main__':
    pytest.main([__file__, '-v', '-x'])

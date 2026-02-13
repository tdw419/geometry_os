"""
Tests for PixelRTS v2 Boot Performance Module

Tests kernel pre-loading, initrd optimization, parallel loading,
and boot configuration management.
"""

import pytest
import sys
import tempfile
import os
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_boot import (
    BootStage,
    LoadPriority,
    AccessPattern,
    BootFile,
    BootConfig,
    BootMetrics,
    BootConfigStore,
    KernelPreloader,
    InitrdOptimizer,
    ParallelBootLoader,
    LazyFileAccessor,
    BootManager,
    create_boot_manager
)


class TestBootStage:
    """Test boot stage enumeration."""

    def test_stage_values(self):
        """Stages should have correct ordering."""
        assert BootStage.INIT.value == 0
        assert BootStage.KERNEL_LOAD.value == 1
        assert BootStage.INITRD_LOAD.value == 2
        assert BootStage.ROOT_MOUNT.value == 3
        assert BootStage.INIT_START.value == 4
        assert BootStage.COMPLETE.value == 5
        assert BootStage.FAILED.value == 6


class TestLoadPriority:
    """Test load priority enumeration."""

    def test_priority_ordering(self):
        """Priorities should be ordered correctly."""
        assert LoadPriority.CRITICAL.value < LoadPriority.HIGH.value
        assert LoadPriority.HIGH.value < LoadPriority.MEDIUM.value
        assert LoadPriority.MEDIUM.value < LoadPriority.LOW.value
        assert LoadPriority.LOW.value < LoadPriority.BACKGROUND.value


class TestBootFile:
    """Test boot file data structure."""

    def test_boot_file_creation(self):
        """Boot file should be created correctly."""
        file = BootFile(
            name='kernel',
            path='/boot/vmlinuz',
            size=8000000,
            priority=LoadPriority.CRITICAL,
            access_pattern=AccessPattern.SEQUENTIAL
        )
        assert file.name == 'kernel'
        assert file.priority == LoadPriority.CRITICAL
        assert file.preload == False

    def test_boot_file_to_dict(self):
        """Boot file should serialize correctly."""
        file = BootFile(
            name='initrd',
            path='/boot/initrd.img',
            size=50000000,
            priority=LoadPriority.HIGH,
            access_pattern=AccessPattern.RANDOM
        )
        d = file.to_dict()
        assert d['name'] == 'initrd'
        assert d['priority'] == 'HIGH'


class TestBootConfig:
    """Test boot configuration."""

    def test_default_config(self):
        """Default config should have sensible values."""
        config = BootConfig()
        assert config.root_device == '/dev/sda1'
        assert config.init == '/sbin/init'
        assert config.console == 'ttyS0'

    def test_config_to_cmdline(self):
        """Config should convert to kernel cmdline."""
        config = BootConfig(
            root_device='/dev/sda2',
            init='/bin/systemd',
            console='tty0',
            quiet=True
        )
        cmdline = config.to_cmdline()
        assert 'root=/dev/sda2' in cmdline
        assert 'init=/bin/systemd' in cmdline
        assert 'console=tty0' in cmdline
        assert 'quiet' in cmdline

    def test_config_serialization(self):
        """Config should serialize/deserialize correctly."""
        config = BootConfig(
            root_device='/dev/nvme0n1p1',
            init='/lib/systemd/systemd',
            debug=True,
            kernel_params=['noapic', 'nomodeset']
        )

        # Serialize
        d = config.to_dict()
        assert d['root_device'] == '/dev/nvme0n1p1'

        # Deserialize
        config2 = BootConfig.from_dict(d)
        assert config2.root_device == config.root_device
        assert config2.init == config.init
        assert config2.debug == config.debug


class TestBootMetrics:
    """Test boot metrics tracking."""

    def test_metrics_creation(self):
        """Metrics should be created with zeros."""
        metrics = BootMetrics()
        assert metrics.start_time == 0.0
        assert metrics.total_bytes_loaded == 0

    def test_total_time(self):
        """Total time should be calculated correctly."""
        metrics = BootMetrics()
        metrics.start_time = 1.0
        metrics.complete_time = 5.5
        assert metrics.total_time() == 4.5

    def test_metrics_to_dict(self):
        """Metrics should serialize correctly."""
        metrics = BootMetrics(
            start_time=1.0,
            kernel_load_time=1.5,
            initrd_load_time=2.0,
            complete_time=3.0,
            cache_hits=10,
            cache_misses=2
        )
        d = metrics.to_dict()
        assert d['total_time'] == 2.0
        assert d['cache_hits'] == 10


class TestBootConfigStore:
    """Test boot configuration store."""

    def test_store_creation(self):
        """Store should be created with default config."""
        store = BootConfigStore()
        assert store.config.root_device == '/dev/sda1'

    def test_get_set_values(self):
        """Store should get/set values correctly."""
        store = BootConfigStore()
        store.set('root_device', '/dev/sda3')
        assert store.get('root_device') == '/dev/sda3'

    def test_override_values(self):
        """Store should support overrides."""
        store = BootConfigStore()
        store.set('root_device', '/dev/override', override=True)
        assert store.get('root_device') == '/dev/override'

    def test_save_load_binary(self):
        """Store should save/load binary config."""
        store = BootConfigStore()
        store.config.root_device = '/dev/test'
        store.config.debug = True

        data = store.save()
        assert data.startswith(b'PRTSBOOT')

        store2 = BootConfigStore()
        assert store2.load(data)
        assert store2.config.root_device == '/dev/test'
        assert store2.config.debug == True

    def test_detect_boot_params(self):
        """Store should detect boot params from cmdline."""
        store = BootConfigStore()
        cmdline = "root=/dev/sda3 init=/bin/bash console=ttyS0,115200 quiet debug"

        params = store.detect_boot_params(cmdline)
        assert store.config.root_device == '/dev/sda3'
        assert store.config.init == '/bin/bash'
        assert store.config.console == 'ttyS0,115200'
        assert store.config.quiet == True
        assert store.config.debug == True

    def test_listener_notification(self):
        """Store should notify listeners on changes."""
        store = BootConfigStore()
        changes = []

        def listener(key, value):
            changes.append((key, value))

        store.add_listener(listener)
        store.set('root_device', '/dev/new')

        assert len(changes) == 1
        assert changes[0] == ('root_device', '/dev/new')


class TestKernelPreloader:
    """Test kernel pre-loading."""

    def test_preloader_creation(self):
        """Preloader should be created correctly."""
        preloader = KernelPreloader()
        assert not preloader.preloaded
        assert len(preloader.sections) == 0

    def test_analyze_elf_kernel(self):
        """Should analyze ELF format kernels."""
        preloader = KernelPreloader()

        # Create minimal ELF header
        elf_header = bytearray(64)
        elf_header[:4] = b'\x7fELF'  # ELF magic
        elf_header[4] = 2  # 64-bit
        elf_header[5] = 1  # Little endian
        elf_header[6] = 1  # ELF version

        sections = preloader.analyze_kernel(bytes(elf_header))
        assert isinstance(sections, dict)

    def test_analyze_compressed_kernel(self):
        """Should analyze compressed kernels."""
        preloader = KernelPreloader()

        # Create gzip header
        gzip_data = b'\x1f\x8b\x08\x00' + b'\x00' * 100

        sections = preloader.analyze_kernel(gzip_data)
        assert 'compressed_kernel' in sections

    def test_analyze_raw_kernel(self):
        """Should analyze raw binary kernels."""
        preloader = KernelPreloader()

        raw_data = b'\x00' * 1000000
        sections = preloader.analyze_kernel(raw_data)

        assert 'text' in sections
        assert 'data' in sections

    def test_preload_section(self):
        """Should preload specific sections."""
        preloader = KernelPreloader()
        preloader.section_info = {
            'test_section': {'offset': 0, 'size': 100}
        }

        kernel_data = b'A' * 100 + b'B' * 100
        section = preloader.preload_section(kernel_data, 'test_section')

        assert len(section) == 100
        assert section == b'A' * 100

    def test_preload_critical(self):
        """Should preload all critical sections."""
        preloader = KernelPreloader()
        preloader.section_info = {
            'critical': {'offset': 0, 'size': 50, 'priority': 'CRITICAL'},
            'high': {'offset': 50, 'size': 50, 'priority': 'HIGH'},
            'low': {'offset': 100, 'size': 50, 'priority': 'LOW'}
        }

        kernel_data = b'X' * 150
        total = preloader.preload_critical(kernel_data)

        assert total == 100  # CRITICAL + HIGH
        assert preloader.preloaded


class TestInitrdOptimizer:
    """Test initrd optimization."""

    def test_optimizer_creation(self):
        """Optimizer should be created correctly."""
        optimizer = InitrdOptimizer()
        assert len(optimizer.index) == 0

    def test_build_optimized(self):
        """Should build optimized initrd."""
        optimizer = InitrdOptimizer()

        files = [
            ('/init', b'#!/bin/sh\necho hello'),
            ('/bin/sh', b'binary data here' * 100),
            ('/etc/config', b'config=1\nother=2')
        ]

        data = optimizer.build_optimized(files)
        assert data.startswith(b'PINITRD')

    def test_load_index(self):
        """Should load file index from initrd."""
        optimizer = InitrdOptimizer()

        files = [
            ('/test', b'test content ' * 100)  # Larger for compression
        ]
        initrd = optimizer.build_optimized(files)

        # Reset optimizer to test fresh load
        optimizer2 = InitrdOptimizer()
        index = optimizer2.load_index(initrd)
        assert '/test' in index

    def test_extract_file(self):
        """Should extract files from initrd."""
        optimizer = InitrdOptimizer()

        original_content = b'test file content ' * 100  # Larger for compression
        files = [
            ('/test.txt', original_content)
        ]
        initrd = optimizer.build_optimized(files)

        # Use fresh optimizer for extraction
        optimizer2 = InitrdOptimizer()
        optimizer2.load_index(initrd)
        extracted = optimizer2.extract_file(initrd, '/test.txt')

        assert extracted == original_content

    def test_compression_decision(self):
        """Should decide compression correctly."""
        optimizer = InitrdOptimizer()

        # Text data should compress
        text_data = b'hello world ' * 1000
        assert optimizer._should_compress('/test.txt', text_data)

        # Already compressed should not recompress
        assert not optimizer._should_compress('/file.gz', text_data)

    def test_entropy_calculation(self):
        """Should calculate entropy correctly."""
        optimizer = InitrdOptimizer()

        # High entropy (random)
        random_data = bytes(range(256)) * 10
        high_entropy = optimizer._calculate_entropy(random_data)
        assert high_entropy > 7.0

        # Low entropy (repetitive)
        low_entropy_data = b'\x00' * 1000
        low_entropy = optimizer._calculate_entropy(low_entropy_data)
        assert low_entropy < 1.0


class TestParallelBootLoader:
    """Test parallel boot loading."""

    def test_loader_creation(self):
        """Loader should be created correctly."""
        loader = ParallelBootLoader(max_workers=2)
        assert loader.max_workers == 2

    def test_load_parallel(self):
        """Should load files in parallel."""
        loader = ParallelBootLoader()

        results = []
        def callback(name, data):
            results.append(name)

        files = [
            ('file1', lambda: b'data1'),
            ('file2', lambda: b'data2'),
            ('file3', lambda: b'data3')
        ]

        loaded = loader.load_parallel(files, callback=callback)

        assert len(loaded) == 3
        assert len(results) == 3

    def test_caching(self):
        """Should cache loaded files."""
        loader = ParallelBootLoader()
        call_count = [0]

        def loader_func():
            call_count[0] += 1
            return b'data'

        files = [('test', loader_func)]

        # First load
        loader.load_parallel(files)
        first_count = call_count[0]

        # Second load should use cache
        loader.load_parallel(files)

        assert call_count[0] == first_count  # No additional calls
        assert loader.metrics.cache_hits > 0

    def test_preload_critical(self):
        """Should preload kernel and initrd in parallel."""
        loader = ParallelBootLoader()

        kernel_loaded = [False]
        initrd_loaded = [False]

        def kernel_loader():
            kernel_loaded[0] = True
            return b'kernel'

        def initrd_loader():
            initrd_loaded[0] = True
            return b'initrd'

        kernel, initrd = loader.preload_critical(kernel_loader, initrd_loader)

        assert kernel == b'kernel'
        assert initrd == b'initrd'
        assert kernel_loaded[0]
        assert initrd_loaded[0]


class TestLazyFileAccessor:
    """Test lazy file access."""

    def test_accessor_creation(self):
        """Accessor should be created correctly."""
        accessor = LazyFileAccessor(block_size=4096)
        assert accessor.block_size == 4096

    def test_read_block(self):
        """Should read and cache blocks."""
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b'A' * 4096)
            f.write(b'B' * 4096)
            f.write(b'C' * 4096)
            f.flush()

            accessor = LazyFileAccessor()

            with open(f.name, 'rb') as fh:
                block0 = accessor.read_block(fh, f.name, 0)
                block1 = accessor.read_block(fh, f.name, 1)

            assert block0 == b'A' * 4096
            assert block1 == b'B' * 4096

            os.unlink(f.name)

    def test_read_range(self):
        """Should read arbitrary byte ranges."""
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b'0123456789' * 1000)  # 10000 bytes
            f.flush()

            accessor = LazyFileAccessor(block_size=1024)

            with open(f.name, 'rb') as fh:
                # Read from offset 500, 100 bytes
                data = accessor.read_range(fh, f.name, 500, 100)

            assert len(data) == 100
            # Verify the content is correct (offset 500 of '0123456789' * 1000)
            expected = b'0123456789' * 1000  # Full data
            assert data == expected[500:600]

            os.unlink(f.name)

    def test_cache_eviction(self):
        """Should evict old cache entries."""
        with tempfile.NamedTemporaryFile(delete=False) as f:
            f.write(b'X' * 10000)
            f.flush()

            accessor = LazyFileAccessor(block_size=1024, cache_size=3)

            with open(f.name, 'rb') as fh:
                # Read blocks sequentially
                accessor.read_block(fh, f.name, 0)
                accessor.read_block(fh, f.name, 1)
                accessor.read_block(fh, f.name, 2)
                accessor.read_block(fh, f.name, 3)  # Should evict block 0
                accessor.read_block(fh, f.name, 4)  # Should evict block 1

            stats = accessor.get_stats()
            # Cache should have at most 3 entries (plus readahead)
            assert stats['cache_entries'] <= 6  # Allow for readahead

            os.unlink(f.name)

    def test_get_stats(self):
        """Should return cache statistics."""
        accessor = LazyFileAccessor()
        stats = accessor.get_stats()

        assert 'cache_entries' in stats
        assert 'access_log_size' in stats


class TestBootManager:
    """Test boot manager."""

    def test_manager_creation(self):
        """Manager should be created correctly."""
        manager = BootManager()
        assert manager._stage == BootStage.INIT

    def test_register_boot_file(self):
        """Should register boot files."""
        manager = BootManager()
        file = BootFile(
            name='test',
            path='/test',
            size=100,
            priority=LoadPriority.MEDIUM,
            access_pattern=AccessPattern.ONCE
        )

        manager.register_boot_file(file)
        assert manager.get_boot_file('/test') == file

    def test_stage_transitions(self):
        """Should transition through boot stages."""
        manager = BootManager()
        stages_seen = []

        def callback(stage):
            stages_seen.append(stage)

        for stage in BootStage:
            manager.on_stage(stage, callback)

        # Create proper initrd with header
        initrd_optimizer = InitrdOptimizer()
        initrd_data = initrd_optimizer.build_optimized([
            ('/init', b'#!/bin/sh')
        ])

        # Simple boot simulation with proper data
        kernel_data = b'\x7fELF' + b'\x00' * 10000

        result = manager.boot(kernel_data, initrd_data)

        assert result == True
        assert BootStage.COMPLETE in stages_seen

    def test_boot_metrics(self):
        """Should track boot metrics."""
        manager = BootManager()

        kernel_data = b'\x00' * 10000
        initrd_data = b'\x00' * 5000

        manager.boot(kernel_data, initrd_data)

        assert manager.metrics.complete_time > 0
        assert manager.metrics.total_bytes_loaded > 0

    def test_get_boot_metadata(self):
        """Should generate boot metadata."""
        manager = BootManager()

        metadata = manager.get_boot_metadata()

        assert 'config' in metadata
        assert 'kernel_sections' in metadata
        assert 'metrics' in metadata

    def test_create_boot_config_section(self):
        """Should create binary config section."""
        manager = BootManager()

        section = manager.create_boot_config_section()
        assert section.startswith(b'PRTSBOOT')


class TestCreateBootManager:
    """Test boot manager factory function."""

    def test_create_default(self):
        """Should create with defaults."""
        manager = create_boot_manager()
        assert manager is not None
        assert isinstance(manager, BootManager)

    def test_create_with_config(self):
        """Should create with custom config."""
        config = BootConfig(
            root_device='/dev/test',
            debug=True
        )
        manager = create_boot_manager(config=config)

        assert manager.config_store.config.root_device == '/dev/test'
        assert manager.config_store.config.debug == True

    def test_create_with_paths(self):
        """Should register files from paths."""
        manager = create_boot_manager(
            kernel_path='/boot/vmlinuz',
            initrd_path='/boot/initrd'
        )

        assert manager.get_boot_file('/boot/vmlinuz') is not None
        assert manager.get_boot_file('/boot/initrd') is not None

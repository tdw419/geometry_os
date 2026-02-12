#!/usr/bin/env python3
"""
Tests for Performance Tuner.

Tests cover:
- TuningConfig validation
- TuningResult creation
- PerformanceTuner functionality
- Cache tuning
- Zone rebalancing
- Cluster optimization
- Benchmarking
- Before/after comparison
"""

import pytest
import time
import tempfile
from pathlib import Path
from unittest.mock import Mock, MagicMock, patch

from systems.pixel_compiler.performance_tuner import (
    TuningConfig,
    TuningResult,
    PerformanceTuner,
)


class TestTuningConfig:
    """Tests for TuningConfig dataclass."""

    def test_default_config(self):
        """Test default configuration values."""
        config = TuningConfig()

        assert config.target_latency_ms == 100.0
        assert config.target_throughput_ops == 1000
        assert config.max_memory_mb == 512
        assert config.enable_auto_tune is True
        assert config.tune_cache is True
        assert config.tune_zones is True
        assert config.tune_clusters is True

    def test_custom_config(self):
        """Test custom configuration values."""
        config = TuningConfig(
            target_latency_ms=50.0,
            target_throughput_ops=2000,
            max_memory_mb=1024,
            enable_auto_tune=False,
            tune_cache=False,
            tune_zones=True,
            tune_clusters=False
        )

        assert config.target_latency_ms == 50.0
        assert config.target_throughput_ops == 2000
        assert config.max_memory_mb == 1024
        assert config.enable_auto_tune is False
        assert config.tune_cache is False
        assert config.tune_zones is True
        assert config.tune_clusters is False

    def test_to_dict(self):
        """Test converting config to dictionary."""
        config = TuningConfig(target_latency_ms=75.0)
        result = config.to_dict()

        assert isinstance(result, dict)
        assert result['target_latency_ms'] == 75.0
        assert 'tune_cache' in result
        assert 'tune_zones' in result


class TestTuningResult:
    """Tests for TuningResult dataclass."""

    def test_success_result(self):
        """Test successful tuning result."""
        result = TuningResult(
            success=True,
            changes_made={'cache': {'max_size': 200}},
            before_metrics={'throughput_ops': 500},
            after_metrics={'throughput_ops': 800},
            improvement_percent=60.0,
            recommendations=['Consider larger cache']
        )

        assert result.success is True
        assert result.improvement_percent == 60.0
        assert len(result.recommendations) == 1

    def test_failure_result(self):
        """Test failed tuning result."""
        result = TuningResult(
            success=False,
            changes_made={},
            before_metrics={},
            after_metrics={},
            improvement_percent=0.0,
            recommendations=['Configuration error']
        )

        assert result.success is False
        assert result.improvement_percent == 0.0

    def test_to_dict(self):
        """Test converting result to dictionary."""
        result = TuningResult(
            success=True,
            changes_made={'test': 'value'},
            before_metrics={'a': 1.0},
            after_metrics={'a': 2.0},
            improvement_percent=50.0,
            recommendations=['test']
        )

        d = result.to_dict()
        assert d['success'] is True
        assert d['improvement_percent'] == 50.0
        assert 'changes_made' in d


class TestPerformanceTuner:
    """Tests for PerformanceTuner class."""

    @pytest.fixture
    def mock_builder(self):
        """Create a mock InfiniteMapBuilderV2."""
        builder = Mock()
        builder.grid_size = 512

        # Mock AI placer with VAT
        mock_placer = Mock()
        mock_vat = Mock()
        mock_vat.entries = {
            'test_file.txt': [Mock(x=256, y=256)],
            'boot/vmlinuz': [Mock(x=257, y=257)],
        }
        mock_vat.lookup = Mock(return_value=Mock(x=256, y=256))
        mock_placer.vat = mock_vat
        builder.ai_placer = mock_placer

        # Mock file data
        builder.file_data = {
            'test_file.txt': b'test content',
            'boot/vmlinuz': b'kernel data',
        }

        # Mock texture cache with proper get_statistics
        mock_cache = Mock()
        mock_cache.get_statistics = Mock(return_value={
            'hits': 10,
            'misses': 2,
            'evictions': 0,
            'entries': 5,
            'hit_rate': 0.83,
            'max_size': 100
        })
        mock_cache.max_size = 100
        mock_cache._cache = {}
        builder._texture_cache = mock_cache

        return builder

    @pytest.fixture
    def tuner(self, mock_builder):
        """Create a PerformanceTuner instance."""
        return PerformanceTuner(mock_builder)

    def test_init(self, mock_builder):
        """Test tuner initialization."""
        tuner = PerformanceTuner(mock_builder)

        assert tuner.builder is mock_builder
        assert tuner.config is not None
        assert tuner._tuning_history == []

    def test_init_with_config(self, mock_builder):
        """Test tuner initialization with custom config."""
        config = TuningConfig(target_latency_ms=50.0)
        tuner = PerformanceTuner(mock_builder, config=config)

        assert tuner.config.target_latency_ms == 50.0

    def test_validate_config_valid(self, tuner):
        """Test valid configuration validation."""
        is_valid, errors = tuner.validate_config()

        assert is_valid is True
        assert errors == []

    def test_validate_config_invalid_latency(self, tuner):
        """Test invalid latency in config."""
        tuner.config.target_latency_ms = -10

        is_valid, errors = tuner.validate_config()

        assert is_valid is False
        assert any('latency' in e.lower() for e in errors)

    def test_validate_config_invalid_throughput(self, tuner):
        """Test invalid throughput in config."""
        tuner.config.target_throughput_ops = 0

        is_valid, errors = tuner.validate_config()

        assert is_valid is False
        assert any('throughput' in e.lower() for e in errors)

    def test_validate_config_invalid_memory(self, tuner):
        """Test invalid memory in config."""
        tuner.config.max_memory_mb = -100

        is_valid, errors = tuner.validate_config()

        assert is_valid is False
        assert any('memory' in e.lower() for e in errors)

    def test_get_current_metrics(self, tuner):
        """Test getting current metrics."""
        metrics = tuner.get_current_metrics()

        assert isinstance(metrics, dict)
        assert 'read_latency_ms' in metrics
        assert 'write_latency_ms' in metrics
        assert 'throughput_ops' in metrics
        assert 'memory_mb' in metrics
        assert 'cache_hit_rate' in metrics

    def test_benchmark(self, tuner):
        """Test running benchmarks."""
        results = tuner.benchmark(iterations=10)

        assert isinstance(results, dict)
        assert results['iterations'] == 10
        assert 'read_latency_ms' in results
        assert 'write_latency_ms' in results
        assert 'throughput_ops' in results
        assert 'cache_hit_rate' in results
        assert 'duration_seconds' in results

    def test_benchmark_with_iterations(self, tuner):
        """Test benchmark with specific iterations."""
        results = tuner.benchmark(iterations=50)

        assert results['iterations'] == 50

    def test_tune_cache_disabled(self, tuner):
        """Test cache tuning when disabled."""
        tuner.config.tune_cache = False
        changes = tuner.tune_cache()

        assert changes == {}

    def test_tune_cache_enabled(self, tuner):
        """Test cache tuning when enabled."""
        tuner.config.tune_cache = True
        changes = tuner.tune_cache()

        # Should return a dict (may be empty if no changes needed)
        assert isinstance(changes, dict)

    def test_tune_zone_distribution_disabled(self, tuner):
        """Test zone tuning when disabled."""
        tuner.config.tune_zones = False
        changes = tuner.tune_zone_distribution()

        assert changes == {}

    def test_tune_zone_distribution_enabled(self, tuner):
        """Test zone tuning when enabled."""
        tuner.config.tune_zones = True

        # Record some accesses to make files candidates for migration
        tuner.record_access('test_file.txt')
        tuner.record_access('test_file.txt')
        tuner.record_access('test_file.txt')

        changes = tuner.tune_zone_distribution()

        assert isinstance(changes, dict)
        assert 'files_migrated' in changes
        assert 'zones_rebalanced' in changes

    def test_tune_cluster_size_disabled(self, tuner):
        """Test cluster tuning when disabled."""
        tuner.config.tune_clusters = False
        changes = tuner.tune_cluster_size()

        assert changes == {}

    def test_tune_cluster_size_enabled(self, tuner):
        """Test cluster tuning when enabled."""
        tuner.config.tune_clusters = True
        changes = tuner.tune_cluster_size()

        assert isinstance(changes, dict)
        assert 'fragmentation_before' in changes
        assert 'fragmentation_after' in changes

    def test_tune_all_invalid_config(self, tuner):
        """Test tune_all with invalid config."""
        tuner.config.target_latency_ms = -1

        result = tuner.tune_all()

        assert result.success is False
        assert 'Configuration error' in result.recommendations[0]

    def test_tune_all_success(self, tuner):
        """Test successful tune_all."""
        result = tuner.tune_all()

        assert result.success is True
        assert isinstance(result.changes_made, dict)
        assert isinstance(result.before_metrics, dict)
        assert isinstance(result.after_metrics, dict)
        assert isinstance(result.improvement_percent, float)
        assert isinstance(result.recommendations, list)

    def test_tune_all_records_history(self, tuner):
        """Test that tune_all records history."""
        initial_count = len(tuner.get_tuning_history())

        tuner.tune_all()

        assert len(tuner.get_tuning_history()) == initial_count + 1

    def test_compare_before_after_no_history(self, tuner):
        """Test comparison with no history."""
        tuner.reset_history()
        comparison = tuner.compare_before_after()

        assert 'error' in comparison
        assert comparison['before'] is None

    def test_compare_before_after_with_history(self, tuner):
        """Test comparison with history."""
        # Run tuning first
        tuner.tune_all()

        comparison = tuner.compare_before_after()

        assert 'error' not in comparison
        assert comparison['before'] is not None
        assert comparison['after'] is not None
        assert 'improvement' in comparison

    def test_record_access(self, tuner):
        """Test recording file accesses."""
        tuner.record_access('test_file.txt')
        tuner.record_access('test_file.txt')
        tuner.record_access('other_file.txt')

        assert tuner._access_counts['test_file.txt'] == 2
        assert tuner._access_counts['other_file.txt'] == 1

    def test_get_tuning_history(self, tuner):
        """Test getting tuning history."""
        tuner.tune_all()
        tuner.tune_all()

        history = tuner.get_tuning_history()

        assert len(history) == 2
        assert all(isinstance(r, TuningResult) for r in history)

    def test_reset_history(self, tuner):
        """Test resetting history."""
        tuner.tune_all()
        assert len(tuner.get_tuning_history()) == 1

        tuner.reset_history()

        assert len(tuner.get_tuning_history()) == 0

    def test_calculate_improvement_positive(self, tuner):
        """Test improvement calculation with positive changes."""
        before = {
            'read_latency_ms': 100.0,
            'throughput_ops': 500.0,
            'cache_hit_rate': 0.5
        }
        after = {
            'read_latency_ms': 50.0,  # 50% improvement
            'throughput_ops': 1000.0,  # 100% improvement
            'cache_hit_rate': 0.75  # 50% improvement
        }

        improvement = tuner._calculate_improvement(before, after)

        # Average of 50% + 100% + 50% = 66.67%
        assert improvement > 0

    def test_calculate_improvement_negative(self, tuner):
        """Test improvement calculation with negative changes."""
        before = {
            'read_latency_ms': 50.0,
            'throughput_ops': 1000.0,
            'cache_hit_rate': 0.8
        }
        after = {
            'read_latency_ms': 100.0,  # Worse
            'throughput_ops': 500.0,  # Worse
            'cache_hit_rate': 0.4  # Worse
        }

        improvement = tuner._calculate_improvement(before, after)

        # All negative changes are clamped to 0
        assert improvement == 0.0


class TestPerformanceTunerIntegration:
    """Integration tests with real builder."""

    @pytest.fixture
    def temp_setup(self):
        """Create temporary directories and files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            source = Path(tmpdir) / "source"
            source.mkdir()

            # Create some test files
            (source / "boot").mkdir()
            (source / "boot" / "vmlinuz").write_bytes(b"kernel" * 100)
            (source / "lib").mkdir()
            (source / "lib" / "libc.so").write_bytes(b"library" * 50)
            (source / "test.txt").write_bytes(b"test data")

            output = Path(tmpdir) / "output.rts.png"

            yield source, output

    def test_full_integration(self, temp_setup):
        """Test full integration with real builder."""
        from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

        source, output = temp_setup

        # Create builder
        builder = InfiniteMapBuilderV2(
            source_dir=str(source),
            output_path=str(output),
            grid_size=256
        )

        # Analyze source to populate file_data
        builder.analyze_source()

        # Create tuner
        tuner = PerformanceTuner(builder)

        # Validate config
        is_valid, errors = tuner.validate_config()
        assert is_valid

        # Get metrics
        metrics = tuner.get_current_metrics()
        assert 'cache_hit_rate' in metrics

        # Run benchmark
        results = tuner.benchmark(iterations=10)
        assert results['iterations'] == 10

        # Tune all
        result = tuner.tune_all()
        assert result.success is True

        # Compare before/after
        comparison = tuner.compare_before_after()
        assert 'improvement_percent' in comparison


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_vat(self):
        """Test tuner with empty VAT."""
        builder = Mock()
        builder.grid_size = 512

        mock_placer = Mock()
        mock_vat = Mock()
        mock_vat.entries = {}
        mock_vat.lookup = Mock(return_value=None)
        mock_placer.vat = mock_vat
        builder.ai_placer = mock_placer
        builder.file_data = {}

        # Add proper mock cache
        mock_cache = Mock()
        mock_cache.get_statistics = Mock(return_value={
            'hits': 0,
            'misses': 0,
            'evictions': 0,
            'entries': 0,
            'hit_rate': 0.0,
            'max_size': 100
        })
        mock_cache.max_size = 100
        mock_cache._cache = {}
        builder._texture_cache = mock_cache

        tuner = PerformanceTuner(builder)
        metrics = tuner.get_current_metrics()

        assert metrics['cache_hit_rate'] == 0.0

    def test_benchmark_zero_iterations(self):
        """Test benchmark with zero iterations."""
        builder = Mock()
        builder.grid_size = 512

        mock_placer = Mock()
        mock_vat = Mock()
        mock_vat.entries = {}
        mock_vat.lookup = Mock(return_value=None)
        mock_placer.vat = mock_vat
        builder.ai_placer = mock_placer
        builder.file_data = {}

        # Add proper mock cache
        mock_cache = Mock()
        mock_cache.get_statistics = Mock(return_value={
            'hits': 0,
            'misses': 0,
            'evictions': 0,
            'entries': 0,
            'hit_rate': 0.0,
            'max_size': 100
        })
        mock_cache.max_size = 100
        mock_cache._cache = {}
        builder._texture_cache = mock_cache

        tuner = PerformanceTuner(builder)
        results = tuner.benchmark(iterations=0)

        assert results['iterations'] == 0

    def test_tune_all_no_tuners_enabled(self):
        """Test tune_all with no tuners enabled."""
        builder = Mock()
        builder.grid_size = 512

        mock_placer = Mock()
        mock_vat = Mock()
        mock_vat.entries = {}
        mock_vat.lookup = Mock(return_value=None)
        mock_placer.vat = mock_vat
        builder.ai_placer = mock_placer
        builder.file_data = {}

        # Add proper mock cache
        mock_cache = Mock()
        mock_cache.get_statistics = Mock(return_value={
            'hits': 0,
            'misses': 0,
            'evictions': 0,
            'entries': 0,
            'hit_rate': 0.0,
            'max_size': 100
        })
        mock_cache.max_size = 100
        mock_cache._cache = {}
        builder._texture_cache = mock_cache

        config = TuningConfig(
            tune_cache=False,
            tune_zones=False,
            tune_clusters=False
        )
        tuner = PerformanceTuner(builder, config=config)
        result = tuner.tune_all()

        # Should still succeed (just no changes)
        assert result.success is True


if __name__ == '__main__':
    pytest.main([__file__, '-v'])

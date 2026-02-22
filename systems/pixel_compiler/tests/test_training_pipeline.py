#!/usr/bin/env python3
"""
Tests for Training Pipeline.

Tests end-to-end ML workflow integrating
TrainingDataCollector and NeuralAccessPredictor.
"""

import pytest
import time
import tempfile
import json
from pathlib import Path
from unittest.mock import Mock, MagicMock
import numpy as np

from systems.pixel_compiler.training_pipeline import (
    TrainingPipeline,
    PipelineConfig,
    PipelineResult,
    TrainingStatistics,
    create_synthetic_vat
)
from systems.pixel_compiler.training_data_collector import (
    TrainingDataCollector,
    AccessEvent,
    ZONE_HOT,
    ZONE_WARM,
)
from systems.pixel_compiler.neural_predictor import (
    NeuralAccessPredictor,
    PredictionFeatures,
    PredictionResult,
    TrainingMetrics,
)

# Alias for clarity
NeuralPredictionFeatures = PredictionFeatures


@pytest.fixture
def pipeline():
    """Create a fresh pipeline for each test."""
    # Clear any previous data
    import tempfile
    import os
    storage_path = os.path.join(tempfile.gettempdir(), "test_training_data.json")
    if os.path.exists(storage_path):
        os.remove(storage_path)
    return TrainingPipeline(mock_mode=True, storage_path=storage_path)


@pytest.fixture
def sample_config():
    """Create sample pipeline configuration."""
    return PipelineConfig(
        epochs=10,
        batch_size=16,
        validation_split=0.2,
        test_split=0.1,
        max_entries=100,
        retention_days=7,
        mock_mode=True
    )


class TestPipelineConfig:
    """Tests for PipelineConfig dataclass."""

    def test_config_creation_defaults(self):
        """PipelineConfig can be created with defaults."""
        config = PipelineConfig()

        assert config.epochs == 50
        assert config.batch_size == 32
        assert config.validation_split == 0.2
        assert config.max_entries == 10000
        assert config.mock_mode == False

    def test_config_creation_custom(self):
        """PipelineConfig can be created with custom values."""
        config = PipelineConfig(
            epochs=100,
            batch_size=64,
            validation_split=0.3,
            mock_mode=True
        )

        assert config.epochs == 100
        assert config.batch_size == 64
        assert config.validation_split == 0.3
        assert config.mock_mode == True

    def test_config_to_dict(self, sample_config):
        """Config can be serialized to dictionary."""
        config_dict = sample_config.to_dict()

        assert config_dict['epochs'] == 10
        assert config_dict['batch_size'] == 16
        assert config_dict['validation_split'] == 0.2
        assert config_dict['mock_mode'] == True

    def test_config_from_dict(self, sample_config):
        """Config can be deserialized from dictionary."""
        config_dict = sample_config.to_dict()
        restored = PipelineConfig.from_dict(config_dict)

        assert restored.epochs == sample_config.epochs
        assert restored.batch_size == sample_config.batch_size
        assert restored.validation_split == sample_config.validation_split
        assert restored.mock_mode == sample_config.mock_mode


class TestPipelineResult:
    """Tests for PipelineResult dataclass."""

    def test_result_creation_success(self):
        """PipelineResult can be created for success."""
        result = PipelineResult(
            success=True,
            samples_collected=100,
            training_metrics=TrainingMetrics(
                mse=0.5,
                mae=10.0,
                epochs=50,
                training_time=5.0,
                accuracy_within_30s=85.0,
                accuracy_within_60s=90.0
            ),
            test_metrics={'mse': 0.6, 'mae': 12.0},
            model_path="/tmp/model.keras"
        )

        assert result.success is True
        assert result.samples_collected == 100
        assert result.training_metrics.mae == 10.0
        assert result.test_metrics['mae'] == 12.0
        assert result.model_path == "/tmp/model.keras"

    def test_result_creation_failure(self):
        """PipelineResult can be created for failure."""
        result = PipelineResult(
            success=False,
            error="No training data available"
        )

        assert result.success is False
        assert result.error == "No training data available"
        assert result.samples_collected == 0
        assert result.training_metrics is None

    def test_result_to_dict(self):
        """PipelineResult can be serialized to dictionary."""
        metrics = TrainingMetrics(
            mse=0.5,
            mae=10.0,
            epochs=50,
            training_time=5.0,
            accuracy_within_30s=85.0,
            accuracy_within_60s=90.0
        )
        result = PipelineResult(
            success=True,
            samples_collected=100,
            training_metrics=metrics
        )

        result_dict = result.to_dict()

        assert result_dict['success'] is True
        assert result_dict['samples_collected'] == 100
        assert 'training_metrics' in result_dict


class TestTrainingPipelineInit:
    """Tests for TrainingPipeline initialization."""

    def test_pipeline_init_default(self):
        """Pipeline initializes with default components."""
        pipeline = TrainingPipeline()

        assert pipeline.collector is not None
        assert isinstance(pipeline.collector, TrainingDataCollector)
        assert pipeline.predictor is not None
        assert isinstance(pipeline.predictor, NeuralAccessPredictor)
        assert pipeline._is_trained is False
        assert pipeline.config.mock_mode is False

    def test_pipeline_init_with_config(self, sample_config):
        """Pipeline can be initialized with custom config."""
        pipeline = TrainingPipeline(config=sample_config)

        assert pipeline.config.epochs == 10
        assert pipeline.config.batch_size == 16
        assert pipeline.config.mock_mode is True

    def test_pipeline_init_with_components(self):
        """Pipeline can be initialized with custom components."""
        collector = TrainingDataCollector(max_entries=50)
        predictor = NeuralAccessPredictor(mock_mode=True)

        pipeline = TrainingPipeline(
            collector=collector,
            predictor=predictor
        )

        assert pipeline.collector is collector
        assert pipeline.predictor is predictor


class TestCollectFromVat:
    """Tests for collect_from_vat method."""

    def test_collect_from_vat(self, pipeline):
        """Can collect training data from VAT."""
        # Create mock VAT
        class MockVAT:
            def __init__(self):
                from systems.pixel_compiler.infinite_map_v2 import ClusterLocation
                self.entries = {
                    "/kernel/vmlinuz": [ClusterLocation(100, 100)],
                    "/boot/config": [ClusterLocation(200, 200)]
                }

        vat = MockVAT()
        count = pipeline.collect_from_vat(vat)

        assert count == 2
        assert len(pipeline.collector.get_all_accesses()) == 2

    def test_collect_from_vat_empty(self, pipeline):
        """Handles empty VAT correctly."""
        class MockVAT:
            def __init__(self):
                self.entries = {}

        vat = MockVAT()
        count = pipeline.collect_from_vat(vat)

        assert count == 0
        assert len(pipeline.collector.get_all_accesses()) == 0


class TestCollectRuntimeData:
    """Tests for collect_runtime_data method."""

    def test_collect_runtime_data(self, pipeline):
        """Can collect runtime access data."""
        count = pipeline.collect_runtime_data(
            duration_seconds=0.1,
            file_paths=["/test/file1", "/test/file2"]
        )

        assert count > 0
        assert len(pipeline.collector.get_all_accesses()) > 0

    def test_collect_runtime_data_default_paths(self, pipeline):
        """Uses default paths when none provided."""
        count = pipeline.collect_runtime_data(duration_seconds=0.05)

        assert count >= 0


class TestExtractFeatures:
    """Tests for extract_features method."""

    def test_extract_features_returns_prediction_features(self, pipeline):
        """Extracts features returning NeuralPredictionFeatures object."""
        features = pipeline.extract_features("/kernel/vmlinuz", file_size=1024*1024)

        assert isinstance(features, NeuralPredictionFeatures)
        assert features.current_zone == ZONE_HOT  # Kernel files are HOT

    def test_extract_features_with_kwargs(self, pipeline):
        """Extracts features with additional parameters."""
        access_time = time.time()
        features = pipeline.extract_features(
            "/lib/libc.so.6",
            file_size=4096,
            access_time=access_time
        )

        assert features.file_size == 4096
        assert features.last_access_time == access_time


class TestTrainModel:
    """Tests for train_model method."""

    def test_train_model_with_no_data(self, pipeline):
        """Returns error result when no training data available."""
        result = pipeline.train_model()

        assert result.success is False
        assert result.error is not None
        assert "No training data" in result.error

    def test_train_model_with_data(self, pipeline):
        """Trains model successfully with collected data."""
        # Add some access events - log same files multiple times
        # to create training data with consecutive accesses
        for i in range(10):
            for j in range(5):  # 5 accesses per file
                time.sleep(0.001)  # Small delay for different timestamps
                pipeline.collector.log_access(f"/test/file{i}", file_size=4096)

        # Train
        result = pipeline.train_model(epochs=5)

        assert result.success is True
        assert result.samples_collected > 0
        assert result.training_metrics is not None
        assert pipeline._is_trained is True

    def test_train_model_custom_parameters(self, pipeline):
        """Accepts custom training parameters."""
        # Add data - log same files multiple times
        for i in range(10):
            for j in range(5):
                time.sleep(0.001)
                pipeline.collector.log_access(f"/test/file{i}", file_size=4096)

        result = pipeline.train_model(
            epochs=3,
            validation_split=0.3,
            batch_size=16
        )

        assert result.success is True
        if result.training_metrics:
            assert result.training_metrics.epochs == 3


class TestEvaluateModel:
    """Tests for evaluate_model method."""

    def test_evaluate_untrained_model(self, pipeline):
        """Returns None for untrained model."""
        stats = pipeline.evaluate_model()
        assert stats is None

    def test_evaluate_trained_model(self, pipeline):
        """Returns statistics for trained model."""
        # Train model first - log same files multiple times
        for i in range(10):
            for j in range(5):
                time.sleep(0.001)
                pipeline.collector.log_access(f"/test/file{i}", file_size=4096)

        pipeline.train_model(epochs=5)

        # Evaluate
        stats = pipeline.evaluate_model()

        assert stats is not None
        assert isinstance(stats, TrainingStatistics)
        assert stats.mse >= 0
        assert stats.mae >= 0
        assert 0 <= stats.accuracy_within_30s <= 100


class TestSaveLoadModel:
    """Tests for save/load model methods."""

    def test_save_model(self, pipeline):
        """Model can be saved to disk."""
        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "test_model"

            # Train first
            for i in range(10):
                for j in range(5):
                    time.sleep(0.001)
                    pipeline.collector.log_access(f"/test/file{i}", file_size=4096)
            pipeline.train_model(epochs=3)

            # Save
            saved_path = pipeline.save_model(str(model_path))

            assert saved_path is not None
            assert Path(saved_path).exists()

            # Check metadata
            metadata_path = Path(str(model_path) + '.pipeline.json')
            assert metadata_path.exists()

    def test_load_model(self, pipeline):
        """Model can be loaded from disk."""
        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "test_model"

            # Train and save
            for i in range(10):
                for j in range(5):
                    time.sleep(0.001)
                    pipeline.collector.log_access(f"/test/file{i}", file_size=4096)
            pipeline.train_model(epochs=3)
            pipeline.save_model(str(model_path))

            # Create new pipeline and load
            new_pipeline = TrainingPipeline(mock_mode=True)
            new_pipeline.load_model(str(model_path))

            assert new_pipeline._is_trained is True

    def test_save_load_preserves_config(self, pipeline):
        """Saving and loading preserves configuration."""
        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "test_model"

            # Set custom config
            custom_config = PipelineConfig(epochs=25, batch_size=16)
            pipeline.set_config(custom_config)

            # Train and save
            for i in range(10):
                for j in range(5):
                    time.sleep(0.001)
                    pipeline.collector.log_access(f"/test/file{i}", file_size=4096)
            pipeline.train_model(epochs=3)
            pipeline.save_model(str(model_path))

            # Load and verify
            new_pipeline = TrainingPipeline(mock_mode=True)
            new_pipeline.load_model(str(model_path))

            assert new_pipeline.config.epochs == 25
            assert new_pipeline.config.batch_size == 16


class TestGetTrainingStatistics:
    """Tests for get_training_statistics method."""

    def test_statistics_untrained(self, pipeline):
        """Returns None for untrained pipeline."""
        stats = pipeline.get_training_statistics()
        assert stats is None

    def test_statistics_trained(self, pipeline):
        """Returns statistics after training."""
        # Train model
        for i in range(10):
            for j in range(5):
                time.sleep(0.001)
                pipeline.collector.log_access(f"/test/file{i}", file_size=4096)
        pipeline.train_model(epochs=5)

        stats = pipeline.get_training_statistics()

        assert stats is not None
        assert 'total_samples' in stats
        assert 'mse' in stats
        assert 'mae' in stats
        assert 'accuracy_within_30s' in stats


class TestPredictNextAccess:
    """Tests for predict_next_access method."""

    def test_predict_untrained(self, pipeline):
        """Returns None for untrained model."""
        result = pipeline.predict_next_access("/test/file")
        assert result is None

    def test_predict_trained(self, pipeline):
        """Returns prediction for trained model."""
        # Train model
        for i in range(10):
            for j in range(5):
                time.sleep(0.001)
                pipeline.collector.log_access(f"/test/file{i}", file_size=4096)
        pipeline.train_model(epochs=5)

        result = pipeline.predict_next_access("/test/file")

        assert result is not None
        assert isinstance(result, PredictionResult)
        assert 0 <= result.predicted_seconds <= 86400
        assert 0 <= result.confidence <= 1


class TestRunFullPipeline:
    """Tests for run_full_pipeline method."""

    def test_full_pipeline_with_vat(self, pipeline):
        """Runs full pipeline with VAT collection."""
        vat = create_synthetic_vat()

        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "model"
            # First collect from VAT
            count = pipeline.collect_from_vat(vat)
            assert count > 0

            # Add additional accesses for training data
            for path in vat.entries.keys():
                for _ in range(3):
                    time.sleep(0.001)
                    pipeline.collector.log_access(path, file_size=4096)

            # Now train
            result = pipeline.train_model(epochs=5)

            assert result.success is True

    def test_full_pipeline_runtime_only(self, pipeline):
        """Runs full pipeline with runtime collection only."""
        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "model"
            result = pipeline.run_full_pipeline(
                vat=None,
                runtime_duration=0.1,
                model_output_path=str(model_path)
            )

            assert result.success is True
            assert result.training_time > 0

    def test_full_pipeline_both_sources(self, pipeline):
        """Runs full pipeline with both VAT and runtime collection."""
        vat = create_synthetic_vat()

        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "model"
            # Collect from VAT
            pipeline.collect_from_vat(vat)
            # Collect runtime data (which creates multiple accesses)
            result = pipeline.run_full_pipeline(
                vat=None,
                runtime_duration=0.05,
                model_output_path=str(model_path)
            )

            assert result.success is True


class TestUtilityMethods:
    """Tests for utility methods."""

    def test_is_trained_false(self, pipeline):
        """is_trained returns False initially."""
        assert pipeline.is_trained() is False

    def test_is_trained_true(self, pipeline):
        """is_trained returns True after training."""
        for i in range(10):
            for j in range(5):
                time.sleep(0.001)
                pipeline.collector.log_access(f"/test/file{i}", file_size=4096)
        pipeline.train_model(epochs=3)

        assert pipeline.is_trained() is True

    def test_get_collector_stats(self, pipeline):
        """Returns collector statistics."""
        pipeline.collector.log_access("/test/file")
        stats = pipeline.get_collector_stats()

        assert stats.total_events >= 1

    def test_get_predictor_info(self, pipeline):
        """Returns predictor information."""
        info = pipeline.get_predictor_info()

        assert isinstance(info, dict)
        assert 'version' in info
        assert 'mock_mode' in info

    def test_get_config(self, pipeline):
        """Returns current configuration."""
        config = pipeline.get_config()
        assert isinstance(config, PipelineConfig)

    def test_set_config(self, pipeline):
        """Can update configuration."""
        new_config = PipelineConfig(epochs=100, batch_size=64)
        pipeline.set_config(new_config)

        assert pipeline.config.epochs == 100
        assert pipeline.config.batch_size == 64


class TestCreateSyntheticVat:
    """Tests for create_synthetic_vat helper."""

    def test_create_synthetic_vat(self):
        """Creates a mock VAT with entries."""
        vat = create_synthetic_vat()

        assert hasattr(vat, 'entries')
        assert len(vat.entries) > 0
        assert hasattr(vat, 'center')


class TestTrainingStatistics:
    """Tests for TrainingStatistics dataclass."""

    def test_statistics_creation(self):
        """TrainingStatistics can be created with all fields."""
        stats = TrainingStatistics(
            total_samples=1000,
            training_samples=800,
            validation_samples=100,
            test_samples=100,
            mse=0.5,
            mae=10.0,
            accuracy_within_30s=85.0,
            accuracy_within_60s=90.0,
            training_time=5.0,
            epochs=50,
            model_size_kb=50.0
        )

        assert stats.total_samples == 1000
        assert stats.mse == 0.5
        assert stats.accuracy_within_30s == 85.0

    def test_statistics_to_dict(self):
        """TrainingStatistics can be serialized."""
        stats = TrainingStatistics(
            total_samples=1000,
            training_samples=800,
            validation_samples=100,
            test_samples=100,
            mse=0.5,
            mae=10.0,
            accuracy_within_30s=85.0,
            accuracy_within_60s=90.0,
            training_time=5.0,
            epochs=50,
            model_size_kb=50.0
        )

        stats_dict = stats.to_dict()

        assert stats_dict['total_samples'] == 1000
        assert stats_dict['mse'] == 0.5
        assert stats_dict['accuracy_within_30s'] == 85.0


class TestIntegration:
    """Integration tests for complete workflow."""

    def test_end_to_end_workflow(self, pipeline):
        """Tests complete end-to-end workflow."""
        with tempfile.TemporaryDirectory() as tmpdir:
            model_path = Path(tmpdir) / "model"

            # 1. Collect data
            vat = create_synthetic_vat()
            count = pipeline.collect_from_vat(vat)
            assert count > 0

            # Add additional accesses for training
            for path in list(vat.entries.keys())[:3]:
                for _ in range(3):
                    time.sleep(0.001)
                    pipeline.collector.log_access(path, file_size=4096)

            # 2. Train model
            result = pipeline.train_model(epochs=5)
            assert result.success is True

            # 3. Evaluate
            stats = pipeline.evaluate_model()
            assert stats is not None

            # 4. Save model
            saved_path = pipeline.save_model(str(model_path))
            assert Path(saved_path).exists()

            # 5. Make prediction
            prediction = pipeline.predict_next_access("/test/file")
            assert prediction is not None

    def test_pipeline_with_synthetic_training(self, pipeline):
        """Tests pipeline using synthetic training data."""
        from systems.pixel_compiler.neural_predictor import create_training_data

        # Create synthetic data
        X, y = create_training_data(num_samples=100)

        # Inject into collector - log same files multiple times
        for i in range(10):
            for j in range(10):
                time.sleep(0.001)
                pipeline.collector.log_access(
                    f"/synthetic/file{i}",
                    file_size=4096
                )

        # Train
        result = pipeline.train_model(epochs=5)

        assert result.success is True
        assert pipeline.is_trained() is True

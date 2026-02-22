#!/usr/bin/env python3
"""
Training Pipeline for Infinite Map OS.

End-to-end ML workflow integrating TrainingDataCollector and
NeuralAccessPredictor for access pattern prediction.

Features:
- Collect training data from VAT or runtime monitoring
- Train neural network with validation
- Evaluate model performance (MSE, MAE)
- Save/load models for deployment
- Production-ready pipeline
"""

import json
import time
import math
import hashlib
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Union
from dataclasses import dataclass, asdict, field
from datetime import datetime
import numpy as np

from systems.pixel_compiler.training_data_collector import (
    TrainingDataCollector,
    AccessEvent,
    CollectorStats,
    ZONE_HOT,
    ZONE_WARM,
    ZONE_TEMPERATE,
    ZONE_COOL,
    ZONE_COLD
)
from systems.pixel_compiler.neural_predictor import (
    NeuralAccessPredictor,
    PredictionFeatures,
    PredictionResult,
    TrainingMetrics,
    create_training_data
)


@dataclass
class PipelineConfig:
    """Configuration for training pipeline."""
    epochs: int = 50
    batch_size: int = 32
    validation_split: float = 0.2
    test_split: float = 0.1
    max_entries: int = 10000
    retention_days: int = 7
    mock_mode: bool = False
    storage_path: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'PipelineConfig':
        return cls(**data)


@dataclass
class PipelineResult:
    """Result of pipeline execution."""
    success: bool
    samples_collected: int = 0
    training_metrics: Optional[TrainingMetrics] = None
    test_metrics: Optional[Dict[str, float]] = None
    model_path: Optional[str] = None
    training_time: float = 0.0
    error: Optional[str] = None
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        result = asdict(self)
        if self.training_metrics:
            result['training_metrics'] = asdict(self.training_metrics)
        return result


@dataclass
class TrainingStatistics:
    """Statistics from training pipeline run."""
    total_samples: int
    training_samples: int
    validation_samples: int
    test_samples: int
    mse: float
    mae: float
    accuracy_within_30s: float
    accuracy_within_60s: float
    training_time: float
    epochs: int
    model_size_kb: float

    def to_dict(self) -> Dict[str, Any]:
        return asdict(self)


class TrainingPipeline:
    """
    End-to-end ML training pipeline for Infinite Map OS.

    Integrates TrainingDataCollector and NeuralAccessPredictor to provide
    complete workflow from data collection to model deployment.

    Workflow:
    1. Collect data from VAT or runtime
    2. Extract features from access events
    3. Train neural network with validation
    4. Evaluate model performance
    5. Save model for deployment

    Example:
        >>> pipeline = TrainingPipeline(mock_mode=True)
        >>> # Collect from VAT
        >>> count = pipeline.collect_from_vat(vat)
        >>> # Train model
        >>> result = pipeline.train_model(epochs=50)
        >>> # Evaluate
        >>> stats = pipeline.evaluate_model()
        >>> # Save
        >>> path = pipeline.save_model("/tmp/model.keras")
    """

    VERSION = "1.0"
    DEFAULT_MODEL_PATH = "/tmp/infinite_map_predictor_model"

    def __init__(
        self,
        collector: Optional[TrainingDataCollector] = None,
        predictor: Optional[NeuralAccessPredictor] = None,
        config: Optional[PipelineConfig] = None,
        mock_mode: bool = False,
        **kwargs
    ):
        """
        Initialize training pipeline.

        Args:
            collector: TrainingDataCollector instance (created if None)
            predictor: NeuralAccessPredictor instance (created if None)
            config: Pipeline configuration (default config if None)
            mock_mode: Use mock mode (deprecated, use config.mock_mode)
            **kwargs: Additional config parameters (for backward compatibility)
        """
        # Handle backward compatibility for mock_mode parameter
        if config is None:
            config = PipelineConfig(mock_mode=mock_mode)
        elif mock_mode:
            config = PipelineConfig(**config.to_dict(), mock_mode=mock_mode)

        # Update config with any additional kwargs
        if kwargs:
            config_dict = config.to_dict()
            config_dict.update(kwargs)
            config = PipelineConfig(**config_dict)

        self.config = config

        # Initialize collector
        if collector is None:
            self.collector = TrainingDataCollector(
                max_entries=self.config.max_entries,
                retention_days=self.config.retention_days,
                storage_path=self.config.storage_path
            )
        else:
            self.collector = collector

        # Initialize predictor
        if predictor is None:
            self.predictor = NeuralAccessPredictor(
                mock_mode=self.config.mock_mode
            )
        else:
            self.predictor = predictor

        # Training state
        self._training_data: Optional[Tuple[np.ndarray, np.ndarray]] = None
        self._test_data: Optional[Tuple[np.ndarray, np.ndarray]] = None
        self._is_trained: bool = False

    def collect_from_vat(
        self,
        vat: Any,
        infinite_map_builder: Optional[Any] = None
    ) -> int:
        """
        Collect training data from Visual Allocation Table.

        Args:
            vat: VisualAllocationTable with entries to scan
            infinite_map_builder: Optional InfiniteMapBuilder for metadata

        Returns:
            Number of files logged
        """
        count = self.collector.auto_collect_from_vat(vat)
        return count

    def collect_runtime_data(
        self,
        duration_seconds: float,
        file_paths: Optional[List[str]] = None
    ) -> int:
        """
        Monitor runtime for access patterns.

        Simulates file access for training data collection.
        In production, this would hook into filesystem events.

        Args:
            duration_seconds: How long to collect (simulation only)
            file_paths: List of files to simulate accessing (default: common paths)

        Returns:
            Number of access events collected
        """
        if file_paths is None:
            file_paths = self._get_common_paths()

        start_time = time.time()
        count = 0

        while (time.time() - start_time) < duration_seconds:
            for path in file_paths:
                # Simulate access with realistic timing
                self.collector.log_access(path)

                count += 1

                # Check if we've exceeded duration
                if (time.time() - start_time) >= duration_seconds:
                    break

            # Small delay between batches
            time.sleep(0.01)

        return count

    def _get_common_paths(self) -> List[str]:
        """Get list of common file paths for simulation."""
        return [
            "/kernel/vmlinuz",
            "/boot/config",
            "/lib/libc.so.6",
            "/lib/ld-linux.so.2",
            "/usr/bin/vi",
            "/usr/bin/python3",
            "/usr/lib/python3.12/os.py",
            "/etc/passwd",
            "/etc/hosts",
            "/var/log/syslog",
            "/home/user/.bashrc",
            "/opt/app/lib.so",
            "/tmp/tempfile"
        ]

    def extract_features(self, path: str, **kwargs) -> PredictionFeatures:
        """
        Extract features for a single file path.

        Args:
            path: File path to extract features for
            **kwargs: Additional parameters (file_size, access_time, etc.)

        Returns:
            PredictionFeatures ready for prediction
        """
        features_dict = self.collector.extract_features(path, **kwargs)

        return PredictionFeatures(
            time_of_day=features_dict['time_of_day'],
            day_of_week=features_dict['day_of_week'],
            recent_frequency=features_dict['recent_frequency'],
            current_zone=features_dict['current_zone'],
            file_size=features_dict['file_size'],
            last_access_time=features_dict['last_access_time'],
            path_hash=features_dict['path_hash']
        )

    def train_model(
        self,
        epochs: Optional[int] = None,
        validation_split: Optional[float] = None,
        batch_size: Optional[int] = None
    ) -> PipelineResult:
        """
        Train the neural network on collected data.

        Args:
            epochs: Number of training epochs (default: from config)
            validation_split: Fraction for validation (default: from config)
            batch_size: Batch size for training (default: from config)

        Returns:
            PipelineResult with training metrics
        """
        start_time = time.time()

        # Use config values if not specified
        epochs = epochs or self.config.epochs
        validation_split = validation_split or self.config.validation_split
        batch_size = batch_size or self.config.batch_size

        try:
            # Get training matrix
            X, y = self.collector.get_training_matrix()

            if len(X) == 0:
                return PipelineResult(
                    success=False,
                    error="No training data available. Collect data first."
                )

            # Convert to numpy arrays
            X = np.array(X, dtype=np.float32)
            y = np.array(y, dtype=np.float32)

            # Split into train/test
            split_idx = int(len(X) * (1 - self.config.test_split))
            X_train, X_test = X[:split_idx], X[split_idx:]
            y_train, y_test = y[:split_idx], y[split_idx:]

            # Store for later evaluation
            self._training_data = (X_train, y_train)
            self._test_data = (X_test, y_test)

            # Train model
            metrics = self.predictor.train(
                X_train, y_train,
                epochs=epochs,
                batch_size=batch_size,
                validation_split=validation_split,
                verbose=1
            )

            # Evaluate on test set
            test_metrics = self.predictor.evaluate(X_test, y_test)

            self._is_trained = True
            training_time = time.time() - start_time

            return PipelineResult(
                success=True,
                samples_collected=len(X_train),
                training_metrics=metrics,
                test_metrics=test_metrics,
                training_time=training_time
            )

        except Exception as e:
            return PipelineResult(
                success=False,
                error=str(e),
                training_time=time.time() - start_time
            )

    def evaluate_model(self) -> Optional[TrainingStatistics]:
        """
        Validate model performance on test set.

        Returns:
            TrainingStatistics with performance metrics, or None if not trained
        """
        if self._test_data is None:
            return None

        X_test, y_test = self._test_data

        # Get predictions
        predictions = self.predictor.model.predict(X_test, verbose=0).flatten()
        predictions_denorm = predictions * 86400

        # Calculate metrics
        mse = float(np.mean((predictions_denorm - y_test) ** 2))
        mae = float(np.mean(np.abs(predictions_denorm - y_test)))

        accuracy_30s = float(np.mean(np.abs(predictions_denorm - y_test) <= 30) * 100)
        accuracy_60s = float(np.mean(np.abs(predictions_denorm - y_test) <= 60) * 100)

        return TrainingStatistics(
            total_samples=len(X_test) + (len(self._training_data[0]) if self._training_data else 0),
            training_samples=len(self._training_data[0]) if self._training_data else 0,
            validation_samples=int(len(self._training_data[0]) * self.config.validation_split) if self._training_data else 0,
            test_samples=len(X_test),
            mse=mse,
            mae=mae,
            accuracy_within_30s=accuracy_30s,
            accuracy_within_60s=accuracy_60s,
            training_time=self._test_data,  # Placeholder
            epochs=self.config.epochs,
            model_size_kb=self.predictor.get_model_size_kb()
        )

    def save_model(self, output_path: str) -> str:
        """
        Save trained model to disk.

        Args:
            output_path: Path to save model

        Returns:
            Actual path where model was saved
        """
        saved_path = self.predictor.save_model(output_path)

        # Save pipeline metadata
        metadata = {
            'version': self.VERSION,
            'config': self.config.to_dict(),
            'is_trained': self._is_trained,
            'timestamp': time.time(),
            'model_path': saved_path
        }

        metadata_path = Path(output_path).with_suffix('.pipeline.json')
        with open(metadata_path, 'w') as f:
            json.dump(metadata, f, indent=2)

        return saved_path

    def load_model(self, model_path: str) -> None:
        """
        Load trained model from disk.

        Args:
            model_path: Path to model file
        """
        self.predictor.load_model(model_path)
        self._is_trained = True

        # Try to load pipeline metadata
        metadata_path = Path(model_path).with_suffix('.pipeline.json')
        if metadata_path.exists():
            with open(metadata_path, 'r') as f:
                metadata = json.load(f)
                if 'config' in metadata:
                    self.config = PipelineConfig.from_dict(metadata['config'])

    def get_training_statistics(self) -> Optional[Dict[str, Any]]:
        """
        Get statistics about the training pipeline.

        Returns:
            Dictionary with training statistics, or None if not trained
        """
        if not self._is_trained:
            return None

        stats = self.evaluate_model()
        if stats is None:
            return None

        return stats.to_dict()

    def predict_next_access(
        self,
        path: str,
        **kwargs
    ) -> Optional[PredictionResult]:
        """
        Make prediction for when file will be accessed next.

        Args:
            path: File path to predict
            **kwargs: Additional parameters for feature extraction

        Returns:
            PredictionResult with prediction, or None if not trained
        """
        if not self._is_trained:
            return None

        features = self.extract_features(path, **kwargs)
        return self.predictor.predict(features)

    def run_full_pipeline(
        self,
        vat: Optional[Any] = None,
        runtime_duration: float = 0.0,
        model_output_path: Optional[str] = None
    ) -> PipelineResult:
        """
        Run complete end-to-end pipeline.

        Args:
            vat: Optional VAT to collect from
            runtime_duration: Seconds to monitor runtime (0 for no monitoring)
            model_output_path: Path to save model (optional)

        Returns:
            PipelineResult with full execution results
        """
        total_samples = 0

        # Collect from VAT if provided
        if vat is not None:
            count = self.collect_from_vat(vat)
            total_samples += count

        # Collect runtime data if duration > 0
        if runtime_duration > 0:
            count = self.collect_runtime_data(runtime_duration)
            total_samples += count

        # Train model
        result = self.train_model()

        # Update samples count
        if result.success:
            result.samples_collected = total_samples

            # Save model if path provided
            if model_output_path:
                saved_path = self.save_model(model_output_path)
                result.model_path = saved_path

        return result

    def is_trained(self) -> bool:
        """Check if model has been trained."""
        return self._is_trained

    def get_collector_stats(self) -> CollectorStats:
        """Get statistics from data collector."""
        return self.collector.get_statistics()

    def get_predictor_info(self) -> Dict[str, Any]:
        """Get information about the predictor."""
        return self.predictor.get_model_info()

    def get_config(self) -> PipelineConfig:
        """Get current pipeline configuration."""
        return self.config

    def set_config(self, config: PipelineConfig) -> None:
        """Update pipeline configuration."""
        self.config = config


def create_synthetic_vat() -> Any:
    """
    Create a synthetic Visual Allocation Table for testing.

    Returns:
        Mock VAT object with entries attribute
    """
    class MockVAT:
        def __init__(self):
            from systems.pixel_compiler.infinite_map_v2 import ClusterLocation

            self.entries = {}
            self.center = (1024, 1024)

            # Add some mock files
            paths = [
                "/kernel/vmlinuz",
                "/boot/config",
                "/lib/libc.so.6",
                "/usr/bin/vi",
                "/usr/lib/python3.12/os.py",
                "/var/log/syslog",
                "/home/user/document.txt"
            ]

            for path in paths:
                # Mock clusters list
                self.entries[path] = [
                    ClusterLocation(100 + hash(path) % 100, 100 + hash(path) % 100)
                ]

    return MockVAT()


def main():
    """CLI for training pipeline."""
    import argparse
    import sys

    parser = argparse.ArgumentParser(
        description='Training Pipeline for Infinite Map OS',
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    parser.add_argument('--collect-vat', action='store_true',
                      help='Collect from synthetic VAT')
    parser.add_argument('--runtime', type=float, default=0.0,
                      help='Collect runtime data for N seconds')
    parser.add_argument('--train', action='store_true',
                      help='Train model on collected data')
    parser.add_argument('--epochs', type=int, default=50,
                      help='Training epochs (default: 50)')
    parser.add_argument('--batch-size', type=int, default=32,
                      help='Batch size (default: 32)')
    parser.add_argument('--validation-split', type=float, default=0.2,
                      help='Validation split (default: 0.2)')
    parser.add_argument('--save-model', metavar='PATH',
                      help='Save model to path')
    parser.add_argument('--load-model', metavar='PATH',
                      help='Load model from path')
    parser.add_argument('--predict', metavar='PATH',
                      help='Predict next access for file')
    parser.add_argument('--stats', action='store_true',
                      help='Show training statistics')
    parser.add_argument('--info', action='store_true',
                      help='Show model information')
    parser.add_argument('--mock', action='store_true',
                      help='Use mock mode')
    parser.add_argument('--full-pipeline', action='store_true',
                      help='Run full end-to-end pipeline')

    args = parser.parse_args()

    # Create pipeline
    config = PipelineConfig(
        epochs=args.epochs,
        batch_size=args.batch_size,
        validation_split=args.validation_split,
        mock_mode=args.mock
    )

    pipeline = TrainingPipeline(config=config)

    try:
        # Load model if specified
        if args.load_model:
            pipeline.load_model(args.load_model)
            print(f"[*] Loaded model from: {args.load_model}")

        # Collect from VAT
        if args.collect_vat:
            vat = create_synthetic_vat()
            count = pipeline.collect_from_vat(vat)
            print(f"[*] Collected {count} files from VAT")

        # Collect runtime data
        if args.runtime > 0:
            count = pipeline.collect_runtime_data(args.runtime)
            print(f"[*] Collected {count} runtime access events")

        # Train model
        if args.train:
            print(f"[*] Training model...")
            result = pipeline.train_model()

            if result.success:
                print(f"[*] Training complete:")
                print(f"    Samples: {result.samples_collected}")
                if result.training_metrics:
                    print(f"    MSE: {result.training_metrics.mse:.4f}")
                    print(f"    MAE: {result.training_metrics.mae:.2f}s")
                    print(f"    Accuracy (30s): {result.training_metrics.accuracy_within_30s:.1f}%")
                    print(f"    Accuracy (60s): {result.training_metrics.accuracy_within_60s:.1f}%")
                    print(f"    Training time: {result.training_time:.2f}s")

                if result.test_metrics:
                    print(f"\n[*] Test metrics:")
                    print(f"    MSE: {result.test_metrics['mse']:.4f}")
                    print(f"    MAE: {result.test_metrics['mae']:.2f}s")
                    print(f"    Accuracy (30s): {result.test_metrics['accuracy_within_30s']:.1f}%")

                # Save model
                if args.save_model:
                    saved_path = pipeline.save_model(args.save_model)
                    print(f"\n[*] Model saved to: {saved_path}")
            else:
                print(f"[!] Training failed: {result.error}")
                sys.exit(1)

        # Predict
        if args.predict:
            result = pipeline.predict_next_access(args.predict)
            if result:
                print(f"[*] Prediction for: {args.predict}")
                print(f"    Next access in: {result.predicted_seconds:.1f}s")
                print(f"    Confidence: {result.confidence:.2f}")
                print(f"    Zone recommendation: {result.zone_recommendation}")
            else:
                print(f"[!] No prediction available (model not trained)")

        # Show statistics
        if args.stats:
            stats = pipeline.get_training_statistics()
            if stats:
                print(f"[*] Training Statistics:")
                print(f"    Total samples: {stats['total_samples']}")
                print(f"    Training samples: {stats['training_samples']}")
                print(f"    Validation samples: {stats['validation_samples']}")
                print(f"    Test samples: {stats['test_samples']}")
                print(f"    MSE: {stats['mse']:.4f}")
                print(f"    MAE: {stats['mae']:.2f}s")
                print(f"    Accuracy (30s): {stats['accuracy_within_30s']:.1f}%")
                print(f"    Accuracy (60s): {stats['accuracy_within_60s']:.1f}%")
                print(f"    Model size: {stats['model_size_kb']:.1f}KB")
            else:
                print("[!] No statistics available (model not trained)")

        # Show model info
        if args.info:
            info = pipeline.get_predictor_info()
            print(f"[*] Model Information:")
            for key, value in info.items():
                print(f"    {key}: {value}")

        # Full pipeline
        if args.full_pipeline:
            print(f"[*] Running full pipeline...")

            # Create synthetic VAT
            vat = create_synthetic_vat()

            # Run full pipeline
            result = pipeline.run_full_pipeline(
                vat=vat,
                runtime_duration=0.1,  # Brief runtime collection
                model_output_path=args.save_model or TrainingPipeline.DEFAULT_MODEL_PATH
            )

            if result.success:
                print(f"[*] Pipeline complete:")
                print(f"    Samples collected: {result.samples_collected}")
                if result.training_metrics:
                    print(f"    MSE: {result.training_metrics.mse:.4f}")
                    print(f"    MAE: {result.training_metrics.mae:.2f}s")
                    print(f"    Accuracy (30s): {result.training_metrics.accuracy_within_30s:.1f}%")
                print(f"    Training time: {result.training_time:.2f}s")
                print(f"    Model saved: {result.model_path}")
            else:
                print(f"[!] Pipeline failed: {result.error}")
                sys.exit(1)

        # Show help if no action
        if not any([
            args.collect_vat, args.runtime > 0, args.train,
            args.predict, args.stats, args.info, args.full_pipeline, args.load_model
        ]):
            parser.print_help()

    except Exception as e:
        print(f"[!] Error: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        sys.exit(1)


if __name__ == '__main__':
    main()

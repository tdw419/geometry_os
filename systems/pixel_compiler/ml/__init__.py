"""
Machine Learning modules for PixelRTS visual artifact analysis.

This package provides ML-based tools for analyzing and classifying
PixelRTS container images, as well as collecting and processing
access logs for ML training and AI-driven optimization.

Modules:
    - autoencoder: Pattern detection and anomaly finding
    - cnn_classifier: Binary structure classification
    - models: Model registry and configuration
    - access_log_collector: Access log collection and management
    - dataset_builder: Training dataset preparation
    - auto_migration: Automatic zone migration engine
    - migration_scheduler: Migration scheduling system
    - predictive_prefetcher: Predictive cache prefetching
    - predictor_base: Abstract base classes for predictors
    - feature_engineering: Feature extraction for access prediction
"""
from systems.pixel_compiler.ml.autoencoder import (
    AnomalyResult,
    ConvAutoencoder,
    PatternAutoencoder,
)

from .cnn_classifier import (
    CnnBinaryClassifier,
    ClassificationResult,
    create_classifier,
    list_available_models as list_cnn_models,
)

from .models import (
    ModelType,
    ModelConfig,
    get_model_config,
    get_input_size,
    get_feature_dim,
    list_available_models as _list_models,
)

from .access_log_collector import (
    AccessLogEntry,
    AccessLogCollector,
    LogRotationConfig,
    OperationType,
    Zone as LogZone,
    create_default_collector,
)

from .dataset_builder import (
    DatasetBuilder,
    TrainingDataset,
    FileStatistics,
    build_training_dataset,
)

from .auto_migration import (
    Zone,
    MigrationReason,
    MigrationCandidate,
    MigrationResult,
    MigrationConfig,
    AutoMigrationEngine,
)

from .migration_scheduler import (
    ScheduleStatus,
    ScheduledMigration,
    SchedulerConfig,
    MigrationScheduler,
)

from .predictive_prefetcher import (
    CacheEntryType,
    PrefetchConfig,
    PrefetchStats,
    CacheEntry,
    PrefetchCandidate,
    PredictivePrefetcher,
    PredictorProtocol,
)

# Access Pattern Prediction (Infinite Map OS v3)
from .predictor_base import (
    PredictorType,
    PredictionTask,
    PredictionResult,
    BatchPredictionResult,
    ModelMetadata,
    TrainingConfig,
    BasePredictor,
    EnsemblePredictor,
)

from .feature_engineering import (
    FileType,
    SizeBucket,
    FileAccessRecord,
    FileMetadata,
    FeatureVector,
    FeatureExtractor,
    FeatureBuilder,
    EXTENSION_MAP,
)

# Online Learning Predictor (Infinite Map OS v3 Phase 7)
from .base_predictor import (
    OnlinePredictionType,
    OnlineFeatureVector,
    OnlinePredictionResult,
    OnlineTrainingStats,
    OnlinePredictorBase,
    # Aliases for backward compatibility
    PredictionType as OnlinePredType,
    FeatureVector as OnlineFeatVector,
    PredictionResult as OnlinePredResult,
    TrainingStats as OnlineTrainStats,
    BasePredictor as OnlineBasePredictor,
)

from .online_predictor import (
    OnlineLearningPredictor,
    OnlinePredictorConfig,
    create_online_predictor,
)

from .model_checkpoint import (
    CheckpointFormat,
    CheckpointMetadata,
    CheckpointInfo,
    ModelCheckpoint,
    save_model,
    load_model,
)

# Model Versioning (Infinite Map OS v3 Phase 7 Task 6)
from .model_versioning import (
    VersionStatus,
    ModelVersion,
    ModelVersioning,
    ABTestExperiment,
    ABTestRequest,
    ABTestManager,
    create_versioning_system,
)


# Combine list functions
def list_available_models():
    """List all available model architectures."""
    return _list_models()


__all__ = [
    # Autoencoder
    "AnomalyResult",
    "ConvAutoencoder",
    "PatternAutoencoder",
    # CNN Classifier
    "CnnBinaryClassifier",
    "ClassificationResult",
    "create_classifier",
    "list_available_models",
    "ModelType",
    "ModelConfig",
    "get_model_config",
    "get_input_size",
    "get_feature_dim",
    # Access Log Collector
    "AccessLogEntry",
    "AccessLogCollector",
    "LogRotationConfig",
    "OperationType",
    "LogZone",
    "create_default_collector",
    # Dataset Builder
    "DatasetBuilder",
    "TrainingDataset",
    "FileStatistics",
    "build_training_dataset",
    # Auto Migration
    "Zone",
    "MigrationReason",
    "MigrationCandidate",
    "MigrationResult",
    "MigrationConfig",
    "AutoMigrationEngine",
    # Migration Scheduler
    "ScheduleStatus",
    "ScheduledMigration",
    "SchedulerConfig",
    "MigrationScheduler",
    # Predictive Prefetcher
    "CacheEntryType",
    "PrefetchConfig",
    "PrefetchStats",
    "CacheEntry",
    "PrefetchCandidate",
    "PredictivePrefetcher",
    "PredictorProtocol",
    # Access Pattern Prediction
    "PredictorType",
    "PredictionTask",
    "PredictionResult",
    "BatchPredictionResult",
    "ModelMetadata",
    "TrainingConfig",
    "BasePredictor",
    "EnsemblePredictor",
    # Feature Engineering
    "FileType",
    "SizeBucket",
    "FileAccessRecord",
    "FileMetadata",
    "FeatureVector",
    "FeatureExtractor",
    "FeatureBuilder",
    "EXTENSION_MAP",
    # Online Learning Predictor
    "OnlinePredictionType",
    "OnlineFeatureVector",
    "OnlinePredictionResult",
    "OnlineTrainingStats",
    "OnlinePredictorBase",
    "OnlineLearningPredictor",
    "OnlinePredictorConfig",
    "create_online_predictor",
    # Model Checkpoint
    "CheckpointFormat",
    "CheckpointMetadata",
    "CheckpointInfo",
    "ModelCheckpoint",
    "save_model",
    "load_model",
    # Model Versioning
    "VersionStatus",
    "ModelVersion",
    "ModelVersioning",
    "ABTestExperiment",
    "ABTestRequest",
    "ABTestManager",
    "create_versioning_system",
]

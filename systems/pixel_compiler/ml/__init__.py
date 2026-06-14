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

from .access_log_collector import (
    AccessLogCollector,
    AccessLogEntry,
    LogRotationConfig,
    OperationType,
    create_default_collector,
)
from .access_log_collector import (
    Zone as LogZone,
)
from .auto_migration import (
    AutoMigrationEngine,
    MigrationCandidate,
    MigrationConfig,
    MigrationReason,
    MigrationResult,
    Zone,
)
from .base_predictor import (
    BasePredictor as OnlineBasePredictor,
)
from .base_predictor import (
    FeatureVector as OnlineFeatVector,
)

# Online Learning Predictor (Infinite Map OS v3 Phase 7)
from .base_predictor import (
    OnlineFeatureVector,
    OnlinePredictionResult,
    OnlinePredictionType,
    OnlinePredictorBase,
    OnlineTrainingStats,
)
from .base_predictor import (
    PredictionResult as OnlinePredResult,
)
from .base_predictor import (
    # Aliases for backward compatibility
    PredictionType as OnlinePredType,
)
from .base_predictor import (
    TrainingStats as OnlineTrainStats,
)
from .cnn_classifier import (
    ClassificationResult,
    CnnBinaryClassifier,
    create_classifier,
)
from .cnn_classifier import (
    list_available_models as list_cnn_models,
)
from .dataset_builder import (
    DatasetBuilder,
    FileStatistics,
    TrainingDataset,
    build_training_dataset,
)
from .feature_engineering import (
    EXTENSION_MAP,
    FeatureBuilder,
    FeatureExtractor,
    FeatureVector,
    FileAccessRecord,
    FileMetadata,
    FileType,
    SizeBucket,
)
from .migration_scheduler import (
    MigrationScheduler,
    ScheduledMigration,
    SchedulerConfig,
    ScheduleStatus,
)
from .model_checkpoint import (
    CheckpointFormat,
    CheckpointInfo,
    CheckpointMetadata,
    ModelCheckpoint,
    load_model,
    save_model,
)

# Model Versioning (Infinite Map OS v3 Phase 7 Task 6)
from .model_versioning import (
    ABTestExperiment,
    ABTestManager,
    ABTestRequest,
    ModelVersion,
    ModelVersioning,
    VersionStatus,
    create_versioning_system,
)
from .models import (
    ModelConfig,
    ModelType,
    get_feature_dim,
    get_input_size,
    get_model_config,
)
from .models import (
    list_available_models as _list_models,
)
from .online_predictor import (
    OnlineLearningPredictor,
    OnlinePredictorConfig,
    create_online_predictor,
)
from .predictive_prefetcher import (
    CacheEntry,
    CacheEntryType,
    PredictivePrefetcher,
    PredictorProtocol,
    PrefetchCandidate,
    PrefetchConfig,
    PrefetchStats,
)

# Access Pattern Prediction (Infinite Map OS v3)
from .predictor_base import (
    BasePredictor,
    BatchPredictionResult,
    EnsemblePredictor,
    ModelMetadata,
    PredictionResult,
    PredictionTask,
    PredictorType,
    TrainingConfig,
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

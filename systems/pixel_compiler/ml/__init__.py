"""
Machine Learning modules for PixelRTS visual artifact analysis.

This package provides ML-based tools for analyzing and classifying
PixelRTS container images.

Modules:
    - autoencoder: Pattern detection and anomaly finding
    - cnn_classifier: Binary structure classification
    - models: Model registry and configuration

Note: Additional modules (access_log_collector, auto_migration, etc.)
are planned but not yet implemented.
"""
from systems.pixel_compiler.ml.autoencoder import (
    AnomalyResult,
    ConvAutoencoder,
    PatternAutoencoder,
)

from systems.pixel_compiler.ml.cnn_classifier import (
    ClassificationResult,
    CnnBinaryClassifier,
    create_classifier,
    list_available_models as list_cnn_models,
)

from systems.pixel_compiler.ml.models import (
    ModelConfig,
    ModelType,
    get_feature_dim,
    get_input_size,
    get_model_config,
    list_available_models as _list_models,
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
    # Models
    "ModelType",
    "ModelConfig",
    "get_model_config",
    "get_input_size",
    "get_feature_dim",
]

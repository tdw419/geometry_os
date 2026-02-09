"""
Machine Learning modules for PixelRTS visual artifact analysis.

This package provides ML-based tools for analyzing and classifying
PixelRTS container images.
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
]

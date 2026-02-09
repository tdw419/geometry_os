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
)

__all__ = [
    # Autoencoder
    "AnomalyResult",
    "ConvAutoencoder",
    "PatternAutoencoder",
    # CNN Classifier
    "CnnBinaryClassifier",
    "ClassificationResult",
    "create_classifier",
    "list_cnn_models",
    "ModelType",
    "ModelConfig",
    "get_model_config",
    "get_input_size",
    "get_feature_dim",
]

# systems/pixel_compiler/ml/models.py
"""
Model registry and factory for CNN-based binary structure classification.

Supports various pre-trained architectures:
- ResNet (18, 34, 50)
- EfficientNet (B0, B4)
- Vision Transformer (ViT)
"""

from typing import Dict, Callable, Optional, List
from dataclasses import dataclass
from enum import Enum


class ModelType(Enum):
    """Supported model architectures."""
    RESNET18 = "resnet18"
    RESNET34 = "resnet34"
    RESNET50 = "resnet50"
    EFFICIENTNET_B0 = "efficientnet_b0"
    EFFICIENTNET_B4 = "efficientnet_b4"
    VIT = "vit"


@dataclass
class ModelConfig:
    """Configuration for a model architecture."""
    name: str
    input_size: int
    feature_dim: int
    min_size: int = 224
    pretrained_url: Optional[str] = None


# Model configurations
MODEL_CONFIGS: Dict[ModelType, ModelConfig] = {
    ModelType.RESNET18: ModelConfig(
        name="resnet18",
        input_size=224,
        feature_dim=512,
        min_size=224
    ),
    ModelType.RESNET34: ModelConfig(
        name="resnet34",
        input_size=224,
        feature_dim=512,
        min_size=224
    ),
    ModelType.RESNET50: ModelConfig(
        name="resnet50",
        input_size=224,
        feature_dim=2048,
        min_size=224
    ),
    ModelType.EFFICIENTNET_B0: ModelConfig(
        name="efficientnet_b0",
        input_size=224,
        feature_dim=1280,
        min_size=224
    ),
    ModelType.EFFICIENTNET_B4: ModelConfig(
        name="efficientnet_b4",
        input_size=380,
        feature_dim=1792,
        min_size=380
    ),
    ModelType.VIT: ModelConfig(
        name="vit",
        input_size=224,
        feature_dim=768,
        min_size=224
    ),
}


def get_model_config(model_name: str) -> ModelConfig:
    """
    Get configuration for a model.

    Args:
        model_name: Name of the model

    Returns:
        ModelConfig for the model

    Raises:
        ValueError: If model name is unknown
    """
    try:
        model_type = ModelType(model_name)
    except ValueError:
        raise ValueError(
            f"Unknown model name: {model_name}. "
            f"Available models: {[m.value for m in ModelType]}"
        )

    return MODEL_CONFIGS[model_type]


def list_available_models() -> List[str]:
    """
    List all available model architectures.

    Returns:
        List of model names
    """
    return [m.value for m in ModelType]


def get_input_size(model_name: str) -> int:
    """
    Get the required input size for a model.

    Args:
        model_name: Name of the model

    Returns:
        Input size (typically 224 or 380)
    """
    config = get_model_config(model_name)
    return config.input_size


def get_feature_dim(model_name: str) -> int:
    """
    Get the feature dimension for a model.

    Args:
        model_name: Name of the model

    Returns:
        Feature dimension (size of the feature vector before classifier)
    """
    config = get_model_config(model_name)
    return config.feature_dim

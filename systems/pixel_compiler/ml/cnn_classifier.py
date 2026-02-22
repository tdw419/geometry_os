# systems/pixel_compiler/ml/cnn_classifier.py
"""
CNN-based binary structure classifier for PixelRTS visual artifacts.

Classifies binary structures in visual representations:
- kernel_code: Executable code sections
- data_section: Data regions
- compressed_data: Compressed/packed data
- unknown: Unclassified regions

Supports transfer learning with pre-trained models:
- ResNet (18, 34, 50)
- EfficientNet (B0, B4)
- Vision Transformer (ViT)
"""

import numpy as np
from pathlib import Path
from typing import Dict, List, Optional, Union, Any, Tuple
from dataclasses import dataclass, field, asdict
import tempfile
import json

try:
    import torch
    import torch.nn as nn
    TORCH_AVAILABLE = True
except ImportError:
    TORCH_AVAILABLE = False
    torch = None
    nn = None

try:
    from PIL import Image
except ImportError:
    raise ImportError(
        "CNN classifier requires PIL/Pillow. "
        "Install with: pip install Pillow"
    )

try:
    import torchvision.transforms as transforms
except ImportError:
    transforms = None

from .models import (
    get_model_config,
    list_available_models,
    get_input_size,
    get_feature_dim,
    ModelType
)


@dataclass
class ClassificationResult:
    """Result of binary structure classification."""
    predicted_class: str
    confidence: float
    class_probabilities: Dict[str, float]
    features: Optional[np.ndarray] = None
    metadata: Dict[str, Any] = field(default_factory=dict)


class MockModel:
    """Mock model for testing without actual PyTorch/dependencies."""

    def __init__(self, num_classes: int, feature_dim: int):
        self.num_classes = num_classes
        self.feature_dim = feature_dim
        self.frozen = False

    def eval(self):
        return self

    def train(self, mode: bool = True):
        return self

    def to(self, device):
        return self

    def parameters(self):
        return []

    def named_parameters(self):
        return []

    def state_dict(self):
        return {'mock': True}

    def load_state_dict(self, state_dict):
        pass


class CnnBinaryClassifier:
    """
    CNN-based classifier for binary structure identification in PixelRTS artifacts.

    Features:
    - Multiple pre-trained architectures (ResNet, EfficientNet, ViT)
    - Transfer learning support
    - Feature extraction capability
    - Batch prediction
    - Mock mode for testing without GPU

    Example:
        >>> classifier = CnnBinaryClassifier('resnet18', num_classes=4, pretrained=False)
        >>> result = classifier.predict('kernel_region.png', mock_mode=True)
        >>> print(result.predicted_class)  # 'kernel_code'
    """

    # Default class labels for binary structures
    DEFAULT_CLASS_LABELS = [
        'kernel_code',
        'data_section',
        'compressed_data',
        'unknown'
    ]

    def __init__(
        self,
        model_name: str = 'resnet18',
        num_classes: int = 4,
        pretrained: bool = False,
        device: str = 'cpu',
        class_labels: Optional[List[str]] = None
    ):
        """
        Initialize the CNN classifier.

        Args:
            model_name: Model architecture (resnet18, resnet34, resnet50,
                        efficientnet_b0, efficientnet_b4, vit)
            num_classes: Number of output classes
            pretrained: Whether to use pre-trained weights
            device: Device to run on ('cpu' or 'cuda')
            class_labels: Optional list of class label names
        """
        # Validate model name
        self.model_config = get_model_config(model_name)
        self.model_name = model_name
        self.num_classes = num_classes
        self.pretrained = pretrained
        self.device = device
        self.class_labels = class_labels or self.DEFAULT_CLASS_LABELS[:num_classes]

        # Confidence threshold for predictions
        self.confidence_threshold = 0.0
        self.frozen = False

        # Initialize model
        self.model = None
        self._initialize_model()

        # Initialize preprocessing transform
        self._initialize_transform()

    def _initialize_model(self):
        """Initialize the model architecture."""
        if not TORCH_AVAILABLE:
            # Use mock model for testing
            feature_dim = get_feature_dim(self.model_name)
            self.model = MockModel(self.num_classes, feature_dim)
            return

        try:
            # Import here to avoid errors if torchvision not available
            from torchvision import models

            # Create model based on architecture
            if self.model_name == 'resnet18':
                self.model = models.resnet18(pretrained=self.pretrained)
                self.model.fc = nn.Linear(self.model.fc.in_features, self.num_classes)
            elif self.model_name == 'resnet34':
                self.model = models.resnet34(pretrained=self.pretrained)
                self.model.fc = nn.Linear(self.model.fc.in_features, self.num_classes)
            elif self.model_name == 'resnet50':
                self.model = models.resnet50(pretrained=self.pretrained)
                self.model.fc = nn.Linear(self.model.fc.in_features, self.num_classes)
            elif self.model_name == 'efficientnet_b0':
                self.model = models.efficientnet_b0(pretrained=self.pretrained)
                self.model.classifier[1] = nn.Linear(
                    self.model.classifier[1].in_features,
                    self.num_classes
                )
            elif self.model_name == 'efficientnet_b4':
                self.model = models.efficientnet_b4(pretrained=self.pretrained)
                self.model.classifier[1] = nn.Linear(
                    self.model.classifier[1].in_features,
                    self.num_classes
                )
            elif self.model_name == 'vit':
                self.model = models.vit_b_16(pretrained=self.pretrained)
                self.model.heads.head = nn.Linear(
                    self.model.heads.head.in_features,
                    self.num_classes
                )
            else:
                raise ValueError(f"Unknown model name: {self.model_name}")

            # Set to evaluation mode
            self.model.eval()
            self.model.to(self.device)

        except ImportError:
            # Fallback to mock model if torchvision not available
            feature_dim = get_feature_dim(self.model_name)
            self.model = MockModel(self.num_classes, feature_dim)

    def _initialize_transform(self):
        """Initialize image preprocessing transforms."""
        input_size = get_input_size(self.model_name)

        if transforms is None:
            self.transform = None
            return

        # Standard ImageNet normalization
        self.transform = transforms.Compose([
            transforms.Resize((input_size, input_size)),
            transforms.ToTensor(),
            transforms.Normalize(
                mean=[0.485, 0.456, 0.406],
                std=[0.229, 0.224, 0.225]
            )
        ])

    def set_class_labels(self, labels: List[str]):
        """
        Set custom class labels.

        Args:
            labels: List of class label names
        """
        if len(labels) != self.num_classes:
            raise ValueError(
                f"Number of labels ({len(labels)}) must match "
                f"num_classes ({self.num_classes})"
            )
        self.class_labels = labels

    def set_confidence_threshold(self, threshold: float):
        """
        Set confidence threshold for predictions.

        Args:
            threshold: Confidence threshold (0-1). Predictions below this
                      threshold will be labeled 'low_confidence'.
        """
        self.confidence_threshold = threshold

    def freeze_feature_extractor(self):
        """Freeze the feature extraction layers for transfer learning."""
        self.frozen = True

        if hasattr(self.model, 'frozen'):
            # Mock model
            self.model.frozen = True
            return

        if not TORCH_AVAILABLE:
            return

        # Freeze all parameters except the final classification layer
        for name, param in self.model.named_parameters():
            if 'fc' not in name and 'classifier' not in name and 'head' not in name:
                param.requires_grad = False

    def predict(
        self,
        image_path: str,
        mock_mode: bool = False,
        return_features: bool = False,
        apply_threshold: bool = False
    ) -> ClassificationResult:
        """
        Predict the class of a single image.

        Args:
            image_path: Path to the input image
            mock_mode: If True, use mock prediction (for testing)
            return_features: If True, return feature vector
            apply_threshold: If True, apply confidence threshold

        Returns:
            ClassificationResult with prediction and metadata
        """
        # Load and preprocess image
        image = self._load_image(image_path)

        if mock_mode or not TORCH_AVAILABLE or isinstance(self.model, MockModel):
            return self._mock_predict(image, return_features, apply_threshold)

        # Real prediction with PyTorch model
        return self._real_predict(image, return_features, apply_threshold)

    def _load_image(self, image_path: str) -> Image.Image:
        """Load and validate an image."""
        image = Image.open(image_path)

        # Convert to RGB if necessary
        if image.mode != 'RGB':
            image = image.convert('RGB')

        return image

    def _mock_predict(
        self,
        image: Image.Image,
        return_features: bool,
        apply_threshold: bool = False
    ) -> ClassificationResult:
        """Generate mock prediction for testing."""
        # Generate pseudo-random but deterministic probabilities based on image
        np.random.seed(hash(image.tobytes()) % (2**32))

        # Generate probabilities
        logits = np.random.randn(self.num_classes)
        exp_logits = np.exp(logits - np.max(logits))
        probabilities = exp_logits / exp_logits.sum()

        # Create probability dictionary
        class_probs = {
            label: float(probabilities[i])
            for i, label in enumerate(self.class_labels)
        }

        # Get predicted class
        predicted_idx = int(np.argmax(probabilities))
        predicted_class = self.class_labels[predicted_idx]
        confidence = float(probabilities[predicted_idx])

        # Apply threshold if requested
        if apply_threshold and confidence < self.confidence_threshold:
            predicted_class = 'low_confidence'

        # Generate mock features if requested
        features = None
        if return_features:
            feature_dim = get_feature_dim(self.model_name)
            features = np.random.randn(feature_dim).astype(np.float32)

        return ClassificationResult(
            predicted_class=predicted_class,
            confidence=confidence,
            class_probabilities=class_probs,
            features=features,
            metadata={
                'model_name': self.model_name,
                'pretrained': self.pretrained,
                'mock_mode': True,
                'image_size': image.size
            }
        )

    def _real_predict(
        self,
        image: Image.Image,
        return_features: bool,
        apply_threshold: bool
    ) -> ClassificationResult:
        """Perform real prediction with PyTorch model."""
        if not TORCH_AVAILABLE:
            return self._mock_predict(image, return_features, apply_threshold)

        # Preprocess
        if self.transform is None:
            return self._mock_predict(image, return_features)

        input_tensor = self.transform(image).unsqueeze(0).to(self.device)

        with torch.no_grad():
            # Get features and logits
            if hasattr(self.model, 'fc'):
                # ResNet
                features = nn.Sequential(*list(self.model.children())[:-1])(input_tensor)
                features = features.view(features.size(0), -1)
                logits = self.model.fc(features)
            elif hasattr(self.model, 'classifier'):
                # EfficientNet
                features = self.model.features(input_tensor)
                features = self.model.avgpool(features)
                features = torch.flatten(features, 1)
                logits = self.model.classifier(features)
            elif hasattr(self.model, 'heads'):
                # ViT
                features = self.model._process_input(input_tensor)
                features = self.model.encoder(features)
                features = features[:, 0]  # CLS token
                logits = self.model.heads(features)
            else:
                # Fallback
                output = self.model(input_tensor)
                if isinstance(output, tuple):
                    features = output[1] if len(output) > 1 else output[0]
                    logits = output[0]
                else:
                    logits = output
                    features = None

        # Convert to probabilities
        probabilities = torch.softmax(logits, dim=1)[0]

        # Get prediction
        confidence_val, predicted_idx = torch.max(probabilities, dim=0)
        confidence = float(confidence_val.item())
        predicted_idx = int(predicted_idx.item())

        # Apply threshold if requested
        if apply_threshold and confidence < self.confidence_threshold:
            predicted_class = 'low_confidence'
        else:
            predicted_class = self.class_labels[predicted_idx]

        # Create probability dictionary
        class_probs = {
            label: float(probabilities[i].item())
            for i, label in enumerate(self.class_labels)
        }

        # Extract features if requested
        feature_array = None
        if return_features and features is not None:
            feature_array = features.cpu().numpy()[0]

        return ClassificationResult(
            predicted_class=predicted_class,
            confidence=confidence,
            class_probabilities=class_probs,
            features=feature_array,
            metadata={
                'model_name': self.model_name,
                'pretrained': self.pretrained,
                'mock_mode': False,
                'image_size': image.size
            }
        )

    def predict_batch(
        self,
        image_paths: List[str],
        batch_size: int = 8,
        mock_mode: bool = False,
        return_features: bool = False
    ) -> List[ClassificationResult]:
        """
        Predict classes for multiple images.

        Args:
            image_paths: List of paths to input images
            batch_size: Batch size for processing
            mock_mode: If True, use mock prediction
            return_features: If True, return feature vectors

        Returns:
            List of ClassificationResult objects
        """
        results = []

        for i in range(0, len(image_paths), batch_size):
            batch_paths = image_paths[i:i + batch_size]

            for path in batch_paths:
                result = self.predict(
                    path,
                    mock_mode=mock_mode,
                    return_features=return_features
                )
                results.append(result)

        return results

    def save_model(self, path: str):
        """
        Save model weights to disk.

        Args:
            path: Path to save the model
        """
        path = Path(path)
        path.parent.mkdir(parents=True, exist_ok=True)

        if isinstance(self.model, MockModel):
            # Save minimal metadata for mock model
            torch.save({
                'model_name': self.model_name,
                'num_classes': self.num_classes,
                'class_labels': self.class_labels,
                'pretrained': self.pretrained,
                'mock': True
            }, path)
        elif TORCH_AVAILABLE:
            torch.save({
                'model_name': self.model_name,
                'num_classes': self.num_classes,
                'class_labels': self.class_labels,
                'pretrained': self.pretrained,
                'state_dict': self.model.state_dict()
            }, path)
        else:
            raise RuntimeError("Cannot save model: PyTorch not available")

    def load_model(self, path: str):
        """
        Load model weights from disk.

        Args:
            path: Path to load the model from
        """
        checkpoint = torch.load(path, map_location=self.device)

        # Restore configuration
        if 'model_name' in checkpoint:
            if checkpoint['model_name'] != self.model_name:
                raise ValueError(
                    f"Model name mismatch: expected {self.model_name}, "
                    f"got {checkpoint['model_name']}"
                )

        if 'num_classes' in checkpoint:
            if checkpoint['num_classes'] != self.num_classes:
                raise ValueError(
                    f"Num classes mismatch: expected {self.num_classes}, "
                    f"got {checkpoint['num_classes']}"
                )

        if 'class_labels' in checkpoint:
            self.class_labels = checkpoint['class_labels']

        # Load weights if not mock
        if not checkpoint.get('mock', False) and TORCH_AVAILABLE:
            if not isinstance(self.model, MockModel):
                self.model.load_state_dict(checkpoint['state_dict'])
        elif checkpoint.get('mock', False):
            # Loading mock checkpoint - just verify
            pass


def create_classifier(
    model_name: str = 'resnet18',
    num_classes: int = 4,
    pretrained: bool = False,
    device: str = 'cpu',
    class_labels: Optional[List[str]] = None
) -> CnnBinaryClassifier:
    """
    Factory function to create a CNN classifier.

    Args:
        model_name: Model architecture name
        num_classes: Number of output classes
        pretrained: Whether to use pre-trained weights
        device: Device to run on
        class_labels: Optional custom class labels

    Returns:
        Configured CnnBinaryClassifier instance
    """
    return CnnBinaryClassifier(
        model_name=model_name,
        num_classes=num_classes,
        pretrained=pretrained,
        device=device,
        class_labels=class_labels
    )


__all__ = [
    'CnnBinaryClassifier',
    'ClassificationResult',
    'create_classifier',
    'list_available_models'
]

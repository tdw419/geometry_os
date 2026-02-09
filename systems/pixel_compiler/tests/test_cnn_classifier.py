# tests/test_cnn_classifier.py
"""
Tests for CNN-based binary structure classifier.
"""
import pytest
import numpy as np
from PIL import Image
import tempfile
from pathlib import Path
from dataclasses import asdict
import json


def test_cnn_classifier_initializes_with_default_params():
    """Test that CnnBinaryClassifier can be initialized with default parameters."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Create with default parameters (mock mode should work without torch)
    classifier = CnnBinaryClassifier(
        model_name='resnet18',
        num_classes=4,
        pretrained=False,
        device='cpu'
    )

    assert classifier is not None
    assert classifier.model_name == 'resnet18'
    assert classifier.num_classes == 4
    assert classifier.device == 'cpu'


def test_cnn_classifier_initializes_with_various_models():
    """Test that CnnBinaryClassifier can be initialized with various model types."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    models = ['resnet18', 'resnet34', 'resnet50', 'efficientnet_b0', 'efficientnet_b4', 'vit']

    for model_name in models:
        classifier = CnnBinaryClassifier(
            model_name=model_name,
            num_classes=4,
            pretrained=False,
            device='cpu'
        )
        assert classifier.model_name == model_name


def test_cnn_classifier_predict_in_mock_mode():
    """Test that predict works in mock mode without requiring actual model."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Create a simple test image
    img_array = np.zeros((224, 224, 3), dtype=np.uint8)
    img_array[:, :] = [128, 64, 32]
    img = Image.fromarray(img_array)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=4,
            pretrained=False,
            device='cpu'
        )

        # Mock mode should return a result without actual inference
        result = classifier.predict(temp_path, mock_mode=True)

        # Verify result structure
        assert hasattr(result, 'predicted_class')
        assert hasattr(result, 'confidence')
        assert hasattr(result, 'class_probabilities')
        assert isinstance(result.predicted_class, str)
        assert isinstance(result.confidence, float)
        assert isinstance(result.class_probabilities, dict)
        assert 0 <= result.confidence <= 1

    finally:
        Path(temp_path).unlink()


def test_cnn_classifier_predict_with_features():
    """Test that predict can return feature vectors."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Create a simple test image
    img_array = np.zeros((224, 224, 3), dtype=np.uint8)
    img_array[:, :] = [64, 128, 192]
    img = Image.fromarray(img_array)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=4,
            pretrained=False,
            device='cpu'
        )

        # Request feature extraction
        result = classifier.predict(temp_path, mock_mode=True, return_features=True)

        assert hasattr(result, 'features')
        assert result.features is not None
        # Feature vector should be a numpy array or list
        assert isinstance(result.features, (np.ndarray, list))

    finally:
        Path(temp_path).unlink()


def test_cnn_classifier_predict_batch():
    """Test batch prediction functionality."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Create multiple test images
    temp_paths = []
    for i in range(3):
        img_array = np.random.randint(0, 256, (224, 224, 3), dtype=np.uint8)
        img = Image.fromarray(img_array)

        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            img.save(f)
            temp_paths.append(f.name)

    try:
        classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=4,
            pretrained=False,
            device='cpu'
        )

        # Batch prediction in mock mode
        results = classifier.predict_batch(temp_paths, batch_size=2, mock_mode=True)

        assert len(results) == 3
        for result in results:
            assert hasattr(result, 'predicted_class')
            assert hasattr(result, 'confidence')

    finally:
        for p in temp_paths:
            Path(p).unlink()


def test_classification_result_serializable():
    """Test that ClassificationResult can be serialized to JSON."""
    from systems.pixel_compiler.ml.cnn_classifier import ClassificationResult

    result = ClassificationResult(
        predicted_class='kernel_code',
        confidence=0.95,
        class_probabilities={
            'kernel_code': 0.95,
            'data_section': 0.03,
            'compressed_data': 0.01,
            'unknown': 0.01
        },
        features=np.array([0.1, 0.2, 0.3]),
        metadata={'model_name': 'resnet18'}
    )

    # Convert to dict and ensure it's JSON-serializable
    result_dict = asdict(result)

    # Features should be list for JSON serialization
    if isinstance(result_dict['features'], np.ndarray):
        result_dict['features'] = result_dict['features'].tolist()

    # Should not raise an error
    json_str = json.dumps(result_dict)
    assert json_str is not None

    # Can deserialize
    parsed = json.loads(json_str)
    assert parsed['predicted_class'] == 'kernel_code'
    assert parsed['confidence'] == 0.95


def test_cnn_classifier_save_and_load_model():
    """Test model save and load functionality."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    classifier = CnnBinaryClassifier(
        model_name='resnet18',
        num_classes=4,
        pretrained=False,
        device='cpu'
    )

    with tempfile.TemporaryDirectory() as tmpdir:
        model_path = Path(tmpdir) / 'model.pth'

        # Save model (in mock mode, this should create a placeholder)
        classifier.save_model(str(model_path))
        assert model_path.exists()

        # Create new classifier and load
        new_classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=4,
            pretrained=False,
            device='cpu'
        )

        new_classifier.load_model(str(model_path))
        assert new_classifier is not None


def test_cnn_classifier_invalid_model_name():
    """Test that invalid model names raise an error."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    with pytest.raises(ValueError, match="Unknown model name"):
        CnnBinaryClassifier(
            model_name='invalid_model',
            num_classes=4,
            pretrained=False,
            device='cpu'
        )


def test_cnn_classifier_class_labels():
    """Test that class labels can be set and used."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    classifier = CnnBinaryClassifier(
        model_name='resnet18',
        num_classes=4,
        pretrained=False,
        device='cpu'
    )

    # Set class labels
    class_labels = ['kernel_code', 'data_section', 'compressed_data', 'unknown']
    classifier.set_class_labels(class_labels)

    # Create test image
    img_array = np.zeros((224, 224, 3), dtype=np.uint8)
    img = Image.fromarray(img_array)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        result = classifier.predict(temp_path, mock_mode=True)

        # Predicted class should be one of the labels
        assert result.predicted_class in class_labels
        # All probability keys should be labels
        for key in result.class_probabilities.keys():
            assert key in class_labels

    finally:
        Path(temp_path).unlink()


def test_cnn_classifier_transfer_learning():
    """Test that transfer learning mode can be enabled."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Create with pretrained enabled (will be mock mode for test)
    classifier = CnnBinaryClassifier(
        model_name='resnet18',
        num_classes=4,
        pretrained=True,
        device='cpu'
    )

    assert classifier.pretrained == True

    # Freeze features for transfer learning
    classifier.freeze_feature_extractor()

    # Should not raise an error
    assert classifier.frozen


def test_cnn_classifier_image_preprocessing():
    """Test that images are preprocessed correctly."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Create test image of different size
    img_array = np.zeros((64, 64, 3), dtype=np.uint8)
    img_array[:, :] = [100, 150, 200]
    img = Image.fromarray(img_array)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=4,
            pretrained=False,
            device='cpu'
        )

        # Should handle different image sizes
        result = classifier.predict(temp_path, mock_mode=True)
        assert result is not None

    finally:
        Path(temp_path).unlink()


def test_cnn_classifier_supported_devices():
    """Test that classifier works with different device specifications."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    # Test with 'cpu' and 'cuda' (even if CUDA not available, should handle gracefully)
    for device in ['cpu', 'cuda']:
        classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=4,
            pretrained=False,
            device=device
        )
        assert classifier.device == device


def test_cnn_classifier_various_num_classes():
    """Test that classifier works with different numbers of classes."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    for num_classes in [2, 4, 8, 16]:
        classifier = CnnBinaryClassifier(
            model_name='resnet18',
            num_classes=num_classes,
            pretrained=False,
            device='cpu'
        )
        assert classifier.num_classes == num_classes


def test_cnn_classifier_confidence_threshold():
    """Test that confidence threshold can be applied."""
    from systems.pixel_compiler.ml.cnn_classifier import CnnBinaryClassifier

    classifier = CnnBinaryClassifier(
        model_name='resnet18',
        num_classes=4,
        pretrained=False,
        device='cpu'
    )

    # Set confidence threshold
    classifier.set_confidence_threshold(0.7)

    # Create test image
    img_array = np.zeros((224, 224, 3), dtype=np.uint8)
    img = Image.fromarray(img_array)

    with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
        img.save(f)
        temp_path = f.name

    try:
        result = classifier.predict(temp_path, mock_mode=True, apply_threshold=True)

        # Should respect threshold
        if result.confidence < 0.7:
            assert result.predicted_class == 'low_confidence'

    finally:
        Path(temp_path).unlink()

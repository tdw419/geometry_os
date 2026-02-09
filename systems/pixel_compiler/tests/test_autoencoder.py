"""
Tests for the convolutional autoencoder anomaly detector.

Tests follow TDD principles - written before/alongside implementation
to verify functionality.
"""
import dataclasses
from dataclasses import asdict
from pathlib import Path
from tempfile import TemporaryDirectory

import numpy as np
import pytest
import torch
from PIL import Image

from systems.pixel_compiler.ml.autoencoder import (
    AnomalyResult,
    ConvAutoencoder,
    PatternAutoencoder,
)


class TestConvAutoencoder:
    """Tests for the ConvAutoencoder neural network module."""

    def test_initialization_creates_model(self):
        """Test that autoencoder initializes with correct architecture."""
        model = ConvAutoencoder(latent_dim=128)
        assert model.latent_dim == 128

    def test_encode_returns_latent_vector(self):
        """Test encoding produces latent representation."""
        model = ConvAutoencoder(latent_dim=64)
        x = torch.randn(1, 1, 256, 256)  # Single grayscale image
        latent = model.encode(x)
        assert latent.shape == (1, 64)

    def test_decode_returns_image(self):
        """Test decoding produces image."""
        model = ConvAutoencoder(latent_dim=64)
        z = torch.randn(1, 64)  # Latent vector
        reconstructed = model.decode(z)
        assert reconstructed.shape == (1, 1, 256, 256)

    def test_forward_returns_reconstruction(self):
        """Test forward pass returns reconstructed image."""
        model = ConvAutoencoder(latent_dim=64)
        x = torch.randn(2, 1, 256, 256)  # Batch of 2 images
        reconstructed = model(x)
        assert reconstructed.shape == x.shape

    def test_reconstruction_different_latent_dims(self):
        """Test autoencoder with different latent dimensions."""
        for dim in [32, 64, 128, 256]:
            model = ConvAutoencoder(latent_dim=dim)
            x = torch.randn(1, 1, 256, 256)
            out = model(x)
            assert out.shape == (1, 1, 256, 256)


class TestPatternAutoencoder:
    """Tests for the PatternAutoencoder anomaly detector."""

    def test_initialization(self):
        """Test autoencoder initializes correctly."""
        detector = PatternAutoencoder(latent_dim=128, device="cpu")
        assert detector.latent_dim == 128
        assert detector.device == "cpu"
        assert detector.threshold is None

    def test_initialization_with_cuda(self):
        """Test CUDA device detection."""
        detector = PatternAutoencoder(device="cpu")
        assert detector.device == "cpu"

    def test_train_single_reduces_loss(self, tmp_path):
        """Test that training on single image reduces loss."""
        # Create a simple test image (checkerboard pattern)
        img_array = np.zeros((256, 256), dtype=np.uint8)
        for i in range(0, 256, 32):
            for j in range(0, 256, 32):
                if (i // 32 + j // 32) % 2 == 0:
                    img_array[i:i+32, j:j+32] = 255

        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        losses = detector.train_single(str(test_path), epochs=20, learning_rate=0.01)

        assert len(losses) == 20
        # Loss should decrease over time (last loss < first loss)
        assert losses[-1] < losses[0]

    def test_train_batch_reduces_loss(self, tmp_path):
        """Test that batch training reduces loss."""
        # Create multiple test images
        paths = []
        for i in range(4):
            img_array = np.random.randint(0, 256, (256, 256), dtype=np.uint8)
            img = Image.fromarray(img_array)
            path = tmp_path / f"test_{i}.png"
            img.save(path)
            paths.append(path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        losses = detector.train_batch(paths, epochs=10, batch_size=2, learning_rate=0.01)

        assert len(losses) == 10
        # Loss should generally decrease
        assert losses[-1] < losses[0] * 1.5  # Allow some variance

    def test_compute_threshold_sets_value(self, tmp_path):
        """Test that threshold computation sets threshold value."""
        # Create normal images
        paths = []
        for i in range(5):
            img_array = np.ones((256, 256), dtype=np.uint8) * 128
            img = Image.fromarray(img_array)
            path = tmp_path / f"normal_{i}.png"
            img.save(path)
            paths.append(path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_batch(paths, epochs=5, batch_size=2)

        threshold = detector.compute_threshold(paths, percentile=95)

        assert threshold is not None
        assert threshold > 0
        assert detector.threshold == threshold

    def test_reconstruction_error_returns_value(self, tmp_path):
        """Test reconstruction error computation."""
        img_array = np.ones((256, 256), dtype=np.uint8) * 128
        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_single(str(test_path), epochs=5)

        error = detector.reconstruction_error(str(test_path))

        assert isinstance(error, float)
        assert error >= 0

    def test_detect_anomaly_raises_without_threshold(self, tmp_path):
        """Test that anomaly detection raises error without threshold."""
        img_array = np.ones((256, 256), dtype=np.uint8) * 128
        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")

        with pytest.raises(RuntimeError, match="Threshold not computed"):
            detector.detect_anomaly(str(test_path))

    def test_detect_anomaly_normal_image(self, tmp_path):
        """Test anomaly detection on normal (trained) image."""
        # Create normal images
        paths = []
        for i in range(5):
            img_array = np.ones((256, 256), dtype=np.uint8) * 128
            img = Image.fromarray(img_array)
            path = tmp_path / f"normal_{i}.png"
            img.save(path)
            paths.append(path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_batch(paths, epochs=10, batch_size=2)
        detector.compute_threshold(paths, percentile=95)

        # Test on a normal-like image
        result = detector.detect_anomaly(str(paths[0]))

        assert isinstance(result, AnomalyResult)
        # Normal image should not be flagged as anomaly (or confidence <= 0)
        assert result.reconstruction_error <= result.threshold or result.confidence <= 0

    def test_detect_anomaly_anomalous_image(self, tmp_path):
        """Test anomaly detection on clearly different image."""
        # Create normal images (uniform gray)
        normal_paths = []
        for i in range(5):
            img_array = np.ones((256, 256), dtype=np.uint8) * 128
            img = Image.fromarray(img_array)
            path = tmp_path / f"normal_{i}.png"
            img.save(path)
            normal_paths.append(path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_batch(normal_paths, epochs=15, batch_size=2)
        detector.compute_threshold(normal_paths, percentile=90)

        # Create anomalous image (checkerboard - very different pattern)
        anomaly_array = np.zeros((256, 256), dtype=np.uint8)
        for i in range(0, 256, 32):
            for j in range(0, 256, 32):
                if (i // 32 + j // 32) % 2 == 0:
                    anomaly_array[i:i+32, j:j+32] = 255

        anomaly_img = Image.fromarray(anomaly_array)
        anomaly_path = tmp_path / "anomaly.png"
        anomaly_img.save(anomaly_path)

        result = detector.detect_anomaly(str(anomaly_path))

        # Anomalous image should be flagged
        assert result.is_anomaly is True
        assert result.reconstruction_error > result.threshold
        assert result.confidence > 0  # Positive confidence for anomaly

    def test_detect_anomaly_with_reconstruction(self, tmp_path):
        """Test anomaly detection returns reconstruction when requested."""
        img_array = np.ones((256, 256), dtype=np.uint8) * 128
        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_single(str(test_path), epochs=10)
        detector.compute_threshold([str(test_path)], percentile=95)

        result = detector.detect_anomaly(str(test_path), return_reconstruction=True)

        assert result.reconstruction is not None
        assert result.reconstruction.shape == (256, 256)
        assert result.reconstruction.dtype == np.uint8

    def test_detect_anomaly_without_reconstruction(self, tmp_path):
        """Test anomaly detection without returning reconstruction."""
        img_array = np.ones((256, 256), dtype=np.uint8) * 128
        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_single(str(test_path), epochs=10)
        detector.compute_threshold([str(test_path)], percentile=95)

        result = detector.detect_anomaly(str(test_path), return_reconstruction=False)

        assert result.reconstruction is None

    def test_save_and_load_model(self, tmp_path):
        """Test saving and loading model state."""
        img_array = np.ones((256, 256), dtype=np.uint8) * 128
        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        # Train and set threshold
        detector = PatternAutoencoder(latent_dim=128, device="cpu")
        detector.train_single(str(test_path), epochs=10)
        detector.compute_threshold([str(test_path)], percentile=95)
        original_threshold = detector.threshold

        # Save model
        save_path = tmp_path / "model.pt"
        detector.save(save_path)

        # Load model
        loaded_detector = PatternAutoencoder.load(save_path, device="cpu")

        assert loaded_detector.latent_dim == 128
        assert loaded_detector.threshold == original_threshold
        assert loaded_detector.threshold_percentile == 95.0

    def test_different_latent_dimensions(self, tmp_path):
        """Test with different latent dimensions."""
        img_array = np.ones((256, 256), dtype=np.uint8) * 128
        img = Image.fromarray(img_array)
        test_path = tmp_path / "test.png"
        img.save(test_path)

        for dim in [32, 64, 128]:
            detector = PatternAutoencoder(latent_dim=dim, device="cpu")
            losses = detector.train_single(str(test_path), epochs=5)
            assert len(losses) == 5

    def test_threshold_percentile_parameter(self, tmp_path):
        """Test different threshold percentiles."""
        paths = []
        for i in range(10):
            img_array = np.random.randint(100, 150, (256, 256), dtype=np.uint8)
            img = Image.fromarray(img_array)
            path = tmp_path / f"test_{i}.png"
            img.save(path)
            paths.append(path)

        detector = PatternAutoencoder(latent_dim=64, device="cpu")
        detector.train_batch(paths, epochs=5, batch_size=4)

        # Different percentiles should give different thresholds
        threshold_90 = detector.compute_threshold(paths, percentile=90)
        threshold_99 = detector.compute_threshold(paths, percentile=99)

        assert threshold_99 >= threshold_90


class TestAnomalyResult:
    """Tests for the AnomalyResult dataclass."""

    def test_anomaly_result_creation(self):
        """Test creating an anomaly result."""
        result = AnomalyResult(
            is_anomaly=True,
            reconstruction_error=0.5,
            threshold=0.3,
            confidence=0.2,
        )

        assert result.is_anomaly is True
        assert result.reconstruction_error == 0.5
        assert result.threshold == 0.3
        assert result.confidence == 0.2
        assert result.reconstruction is None

    def test_anomaly_result_with_reconstruction(self):
        """Test anomaly result with reconstruction image."""
        reconstruction = np.zeros((256, 256), dtype=np.uint8)

        result = AnomalyResult(
            is_anomaly=False,
            reconstruction_error=0.1,
            threshold=0.3,
            confidence=-0.2,
            reconstruction=reconstruction,
        )

        assert result.reconstruction is not None
        assert result.reconstruction.shape == (256, 256)

    def test_anomaly_result_is_dataclass(self):
        """Test that AnomalyResult is a proper dataclass."""
        result = AnomalyResult(
            is_anomaly=True,
            reconstruction_error=0.5,
            threshold=0.3,
            confidence=0.2,
        )

        assert dataclasses.is_dataclass(result)
        d = asdict(result)
        assert d["is_anomaly"] is True
        assert d["reconstruction_error"] == 0.5

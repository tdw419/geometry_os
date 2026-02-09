"""
Convolutional Autoencoder for Anomaly Detection in PixelRTS Visual Artifacts.

This module provides a convolutional autoencoder that learns to reconstruct normal
patterns in PixelRTS container images. Anomalies are detected via reconstruction error.
"""
from __future__ import annotations

import dataclasses
from dataclasses import dataclass, field
from pathlib import Path
from typing import TYPE_CHECKING, List, Optional, Tuple

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from PIL import Image

if TYPE_CHECKING:
    from torch.utils.data import DataLoader


@dataclass
class AnomalyResult:
    """Result of anomaly detection on a single image.

    Attributes:
        is_anomaly: Whether the image is classified as an anomaly
        reconstruction_error: Mean squared error of reconstruction
        threshold: The threshold used for classification
        confidence: Distance from threshold (negative = normal, positive = anomaly)
        reconstruction: The reconstructed image array (optional)
    """
    is_anomaly: bool
    reconstruction_error: float
    threshold: float
    confidence: float
    reconstruction: Optional[np.ndarray] = None


class ConvAutoencoder(nn.Module):
    """Convolutional autoencoder for image reconstruction.

    Architecture:
        - Encoder: Conv2d -> ReLU -> MaxPool -> Conv2d -> ReLU -> MaxPool
        - Latent: Dense representation
        - Decoder: ConvTranspose2d -> ReLU -> ConvTranspose2d -> Sigmoid
    """

    def __init__(self, latent_dim: int = 128):
        """Initialize the autoencoder.

        Args:
            latent_dim: Dimension of the latent representation
        """
        super().__init__()
        self.latent_dim = latent_dim

        # Encoder: compresses input to latent representation
        self.encoder = nn.Sequential(
            # Input: (batch, 1, H, W) -> (batch, 16, H/2, W/2)
            nn.Conv2d(1, 16, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),  # 2x downsampling

            # (batch, 16, H/2, W/2) -> (batch, 8, H/4, W/4)
            nn.Conv2d(16, 8, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2, 2),  # 2x downsampling
        )

        # Latent space: flattened and dense
        # After two MaxPool2d(2), spatial dims are H/4 x W/4
        # For 256x256 input -> 64x64 feature map with 8 channels
        self.flatten = nn.Flatten()
        self.fc_encode = nn.Linear(8 * 64 * 64, latent_dim)  # Assumes 256x256 input
        self.fc_decode = nn.Linear(latent_dim, 8 * 64 * 64)

        # Decoder: reconstructs from latent representation
        self.decoder = nn.Sequential(
            # (batch, 8, H/4, W/4) -> (batch, 16, H/2, W/2)
            nn.ConvTranspose2d(8, 16, kernel_size=2, stride=2),
            nn.ReLU(),

            # (batch, 16, H/2, W/2) -> (batch, 1, H, W)
            nn.ConvTranspose2d(16, 1, kernel_size=2, stride=2),
            nn.Sigmoid(),  # Output in [0, 1] range
        )

    def encode(self, x: torch.Tensor) -> torch.Tensor:
        """Encode input to latent representation.

        Args:
            x: Input tensor of shape (batch, 1, H, W)

        Returns:
            Latent representation tensor
        """
        x = self.encoder(x)
        x = self.flatten(x)
        x = self.fc_encode(x)
        return x

    def decode(self, z: torch.Tensor) -> torch.Tensor:
        """Decode latent representation to image.

        Args:
            z: Latent tensor of shape (batch, latent_dim)

        Returns:
            Reconstructed image tensor
        """
        x = self.fc_decode(z)
        # Reshape to (batch, 8, H/4, W/4)
        x = x.view(-1, 8, 64, 64)
        x = self.decoder(x)
        return x

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """Forward pass through autoencoder.

        Args:
            x: Input tensor of shape (batch, 1, H, W)

        Returns:
            Reconstructed image tensor
        """
        z = self.encode(x)
        return self.decode(z)


class PatternAutoencoder:
    """Autoencoder-based anomaly detector for PixelRTS patterns.

    Learns to reconstruct normal patterns and detects anomalies via
    reconstruction error - anomalous patterns have higher reconstruction error.
    """

    def __init__(
        self,
        latent_dim: int = 128,
        device: Optional[str] = None,
        threshold_percentile: float = 95.0,
    ):
        """Initialize the anomaly detector.

        Args:
            latent_dim: Dimension of the latent representation
            device: Device to run on ('cuda', 'cpu', or None for auto-detect)
            threshold_percentile: Percentile for threshold calculation
        """
        self.latent_dim = latent_dim

        if device is None:
            device = "cuda" if torch.cuda.is_available() else "cpu"
        self.device = device

        self.threshold_percentile = threshold_percentile
        self.threshold: Optional[float] = None

        self.model = ConvAutoencoder(latent_dim=latent_dim).to(device)
        self.optimizer: Optional[optim.Optimizer] = None

    def _load_image(self, image_path: str | Path) -> torch.Tensor:
        """Load and preprocess an image.

        Args:
            image_path: Path to the image file

        Returns:
            Preprocessed tensor of shape (1, 1, H, W)
        """
        img = Image.open(image_path).convert("L")  # Convert to grayscale
        img = img.resize((256, 256))  # Resize to fixed size
        img_array = np.array(img) / 255.0  # Normalize to [0, 1]
        tensor = torch.from_numpy(img_array).float().unsqueeze(0).unsqueeze(0)
        return tensor.to(self.device)

    def _create_loader(
        self, image_paths: List[str | Path], batch_size: int = 8
    ) -> "DataLoader[torch.Tensor]":
        """Create a DataLoader for batch training.

        Args:
            image_paths: List of image file paths
            batch_size: Batch size for training

        Returns:
            DataLoader yielding preprocessed image batches
        """
        from torch.utils.data import Dataset, DataLoader

        class ImageDataset(Dataset):
            def __init__(self, paths: List[str | Path], device: str):
                self.paths = [str(p) for p in paths]
                self.device = device

            def __len__(self) -> int:
                return len(self.paths)

            def __getitem__(self, idx: int) -> torch.Tensor:
                img = Image.open(self.paths[idx]).convert("L")
                img = img.resize((256, 256))
                img_array = np.array(img) / 255.0
                tensor = torch.from_numpy(img_array).float()
                return tensor

        dataset = ImageDataset(image_paths, self.device)
        return DataLoader(dataset, batch_size=batch_size, shuffle=True)

    def train_single(
        self,
        image_path: str | Path,
        epochs: int = 100,
        learning_rate: float = 0.001,
    ) -> List[float]:
        """Train on a single image.

        Args:
            image_path: Path to the training image
            epochs: Number of training epochs
            learning_rate: Learning rate for optimizer

        Returns:
            List of training losses per epoch
        """
        self.optimizer = optim.Adam(self.model.parameters(), lr=learning_rate)
        criterion = nn.MSELoss()

        image = self._load_image(image_path)
        losses = []

        self.model.train()
        for epoch in range(epochs):
            self.optimizer.zero_grad()
            reconstruction = self.model(image)
            loss = criterion(reconstruction, image)
            loss.backward()
            self.optimizer.step()
            losses.append(loss.item())

        return losses

    def train_batch(
        self,
        image_paths: List[str | Path],
        epochs: int = 50,
        batch_size: int = 8,
        learning_rate: float = 0.001,
    ) -> List[float]:
        """Train on a batch of images.

        Args:
            image_paths: List of training image paths
            epochs: Number of training epochs
            batch_size: Batch size for training
            learning_rate: Learning rate for optimizer

        Returns:
            List of training losses per epoch
        """
        self.optimizer = optim.Adam(self.model.parameters(), lr=learning_rate)
        criterion = nn.MSELoss()

        loader = self._create_loader(image_paths, batch_size)
        losses = []

        self.model.train()
        for epoch in range(epochs):
            epoch_loss = 0.0
            for batch in loader:
                batch = batch.unsqueeze(1).to(self.device)  # Add channel dim
                self.optimizer.zero_grad()
                reconstruction = self.model(batch)
                loss = criterion(reconstruction, batch)
                loss.backward()
                self.optimizer.step()
                epoch_loss += loss.item()
            losses.append(epoch_loss / len(loader))

        return losses

    def compute_threshold(
        self,
        normal_images: List[str | Path],
        percentile: Optional[float] = None,
    ) -> float:
        """Compute anomaly threshold from normal images.

        Args:
            normal_images: List of known normal image paths
            percentile: Percentile for threshold (defaults to self.threshold_percentile)

        Returns:
            Computed threshold value
        """
        if percentile is None:
            percentile = self.threshold_percentile

        self.model.eval()
        errors = []

        with torch.no_grad():
            for path in normal_images:
                error = self.reconstruction_error(path)
                errors.append(error)

        self.threshold = float(np.percentile(errors, percentile))
        return self.threshold

    def reconstruction_error(self, image_path: str | Path) -> float:
        """Compute reconstruction error for an image.

        Args:
            image_path: Path to the image

        Returns:
            Mean squared reconstruction error
        """
        self.model.eval()
        image = self._load_image(image_path)

        with torch.no_grad():
            reconstruction = self.model(image)
            mse = torch.mean((image - reconstruction) ** 2).item()

        return mse

    def detect_anomaly(
        self,
        image_path: str | Path,
        return_reconstruction: bool = False,
    ) -> AnomalyResult:
        """Detect if an image is anomalous.

        Args:
            image_path: Path to the image to check
            return_reconstruction: Whether to return the reconstructed image

        Returns:
            AnomalyResult with detection results

        Raises:
            RuntimeError: If threshold has not been computed
        """
        if self.threshold is None:
            raise RuntimeError(
                "Threshold not computed. Call compute_threshold() first."
            )

        self.model.eval()
        image = self._load_image(image_path)

        with torch.no_grad():
            reconstruction = self.model(image)
            error = torch.mean((image - reconstruction) ** 2).item()

        is_anomaly = error > self.threshold
        confidence = error - self.threshold

        result = AnomalyResult(
            is_anomaly=is_anomaly,
            reconstruction_error=error,
            threshold=self.threshold,
            confidence=confidence,
        )

        if return_reconstruction:
            # Convert back to numpy array
            rec_np = reconstruction.squeeze().cpu().numpy()
            rec_np = (rec_np * 255).astype(np.uint8)
            result.reconstruction = rec_np

        return result

    def save(self, path: str | Path) -> None:
        """Save model state.

        Args:
            path: Path to save the model
        """
        state = {
            "latent_dim": self.latent_dim,
            "threshold": self.threshold,
            "threshold_percentile": self.threshold_percentile,
            "model_state_dict": self.model.state_dict(),
        }
        torch.save(state, path)

    @classmethod
    def load(cls, path: str | Path, device: Optional[str] = None) -> "PatternAutoencoder":
        """Load a saved model.

        Args:
            path: Path to the saved model
            device: Device to load on (defaults to cuda if available)

        Returns:
            Loaded PatternAutoencoder instance
        """
        state = torch.load(path, map_location=device or "cpu")

        instance = cls(
            latent_dim=state["latent_dim"],
            device=device,
            threshold_percentile=state.get("threshold_percentile", 95.0),
        )
        instance.model.load_state_dict(state["model_state_dict"])
        instance.threshold = state.get("threshold")

        return instance

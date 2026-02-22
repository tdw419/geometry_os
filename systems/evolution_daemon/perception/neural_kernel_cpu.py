"""
Neural Kernel CPU Implementation

CPU-only fallback for NeuralPerceptionKernel when WebGPU is unavailable.
"""

import numpy as np
from typing import Dict, Any


class NeuralKernelCPU:
    """CPU implementation of neural perception kernel."""

    def __init__(self, patch_size: int = 16):
        self.patch_size = patch_size
        self._weights = self._init_weights()

    def _init_weights(self) -> np.ndarray:
        """Initialize random classification weights."""
        return np.random.randn(4, 64).astype(np.float32)

    def _extract_features(self, patch_bytes: bytes) -> np.ndarray:
        """Extract 64-dim feature vector from patch."""
        patch = np.frombuffer(patch_bytes, dtype=np.uint8)
        patch = patch.reshape((self.patch_size, self.patch_size, 4))

        # Convert to grayscale
        gray = patch[:, :, :3].mean(axis=2) / 255.0

        features = np.zeros(64, dtype=np.float32)

        # Row means (0-15)
        features[:16] = gray.mean(axis=1)

        # Column means (16-31)
        features[16:32] = gray.mean(axis=0)

        # Horizontal gradients (32-47)
        features[32:48] = np.abs(np.diff(gray, axis=1)).mean(axis=1)

        # Vertical gradients (48-63)
        features[48:64] = np.abs(np.diff(gray, axis=0)).mean(axis=0)

        return features

    def _calculate_entropy(self, patch_bytes: bytes) -> float:
        """Calculate entropy of patch."""
        patch = np.frombuffer(patch_bytes, dtype=np.uint8)
        hist = np.bincount(patch[::4], minlength=256)  # R channel
        hist = hist / hist.sum()

        entropy = -np.sum(hist[hist > 0] * np.log2(hist[hist > 0]))
        return entropy / 8.0  # Normalize to 0-1

    def classify(self, patch_bytes: bytes) -> Dict[str, Any]:
        """Classify a patch."""
        entropy = self._calculate_entropy(patch_bytes)

        # Low entropy = fracture (uniform/dead)
        if entropy < 0.1:
            return {'type': 'fracture', 'confidence': 1.0 - entropy}

        # Extract features
        features = self._extract_features(patch_bytes)

        # Classify with weights
        scores = features @ self._weights.T

        # Softmax
        exp_scores = np.exp(scores - scores.max())
        probs = exp_scores / exp_scores.sum()

        best_class = probs.argmax()
        class_names = ['code', 'data', 'fracture', 'noise']

        return {
            'type': class_names[best_class],
            'confidence': float(probs[best_class])
        }

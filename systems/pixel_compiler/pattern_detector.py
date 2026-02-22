# pattern_detector.py
"""
Pattern Detector for PixelRTS Vision Analysis

Provides computer vision algorithms for detecting structural patterns
in binary visualizations encoded as PixelRTS artifacts.
"""

import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any
from dataclasses import dataclass, field
import tempfile

try:
    import cv2
except ImportError:
    raise ImportError(
        "Pattern detection requires OpenCV. "
        "Install with: pip install opencv-python"
    )

try:
    from PIL import Image
except ImportError:
    raise ImportError(
        "Pattern detection requires PIL/Pillow. "
        "Install with: pip install Pillow"
    )

try:
    from sklearn.cluster import DBSCAN
except ImportError:
    DBSCAN = None
    raise ImportError(
        "Clustering requires scikit-learn. "
        "Install with: pip install scikit-learn"
    )

try:
    from scipy import fft
    from scipy.ndimage import label as ndimage_label
except ImportError:
    fft = None
    ndimage_label = None
    raise ImportError(
        "Fourier analysis requires scipy. "
        "Install with: pip install scipy"
    )


@dataclass
class EdgeDetectionResult:
    """Result of edge detection analysis."""
    method: str
    edges: np.ndarray
    edge_count: int
    edge_density: float
    strong_edges: List[Tuple[int, int]] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class FourierAnalysisResult:
    """Result of Fourier transform analysis."""
    frequencies: np.ndarray
    magnitude: np.ndarray
    dominant_frequency: Tuple[float, float]
    periodic_regions: List[Dict[str, Any]]
    has_periodic_patterns: bool


@dataclass
class ClusterResult:
    """Result of clustering analysis."""
    num_clusters: int
    cluster_labels: np.ndarray
    cluster_centers: List[Tuple[float, float]]
    regions_of_interest: List[Dict[str, Any]]
    noise_points: int


class PatternDetector:
    """
    Detects structural patterns in PixelRTS visual artifacts.

    Features:
    - Edge detection (Sobel, Canny) for boundary identification
    - Fourier transform for periodic pattern detection
    - DBSCAN clustering for region of interest detection
    """

    def __init__(self, image_path: str):
        """
        Initialize pattern detector with an image.

        Args:
            image_path: Path to PNG image file
        """
        self.image_path = image_path

        # Load and convert image
        self._load_image()

    def _load_image(self):
        """Load the image and convert to grayscale for analysis."""
        # Load with PIL
        pil_image = Image.open(self.image_path)

        # Ensure RGBA
        if pil_image.mode != 'RGBA':
            pil_image = pil_image.convert('RGBA')

        self.image = np.array(pil_image)
        self.height, self.width = self.image.shape[:2]

        # Convert to grayscale for edge detection
        # Use RGB channels (ignoring alpha)
        if len(self.image.shape) == 3:
            # RGB or RGBA
            self.grayscale = cv2.cvtColor(
                self.image[:, :, :3],
                cv2.COLOR_RGB2GRAY
            )
        else:
            self.grayscale = self.image

    def detect_edges_sobel(
        self,
        threshold: Optional[float] = None
    ) -> EdgeDetectionResult:
        """
        Detect edges using Sobel operator.

        Args:
            threshold: Optional threshold for edge binary classification.
                      If None, returns raw gradient magnitude.

        Returns:
            EdgeDetectionResult with detected edges
        """
        # Apply Sobel operators
        sobel_x = cv2.Sobel(self.grayscale, cv2.CV_64F, 1, 0, ksize=3)
        sobel_y = cv2.Sobel(self.grayscale, cv2.CV_64F, 0, 1, ksize=3)

        # Calculate gradient magnitude
        gradient_magnitude = np.sqrt(sobel_x**2 + sobel_y**2)

        # Normalize to 0-255 range
        gradient_magnitude = np.clip(gradient_magnitude, 0, 255).astype(np.uint8)

        # Apply threshold if specified
        edges = gradient_magnitude
        if threshold is not None:
            edges = (gradient_magnitude > threshold).astype(np.uint8) * 255

        # Count edge pixels
        edge_pixels = np.sum(edges > 0)
        edge_count = int(edge_pixels)
        edge_density = edge_count / (self.width * self.height)

        # Find strong edges (top 10% by magnitude)
        strong_threshold = np.percentile(gradient_magnitude[gradient_magnitude > 0], 90) if edge_count > 0 else 0
        strong_edge_indices = np.where(gradient_magnitude >= strong_threshold)
        strong_edges = list(zip(strong_edge_indices[1], strong_edge_indices[0]))  # (x, y) format

        return EdgeDetectionResult(
            method='sobel',
            edges=edges,
            edge_count=edge_count,
            edge_density=edge_density,
            strong_edges=strong_edges[:100],  # Limit to 100 strongest
            metadata={
                'gradient_mean': float(np.mean(gradient_magnitude)),
                'gradient_std': float(np.std(gradient_magnitude)),
                'gradient_max': float(np.max(gradient_magnitude)),
                'threshold_applied': threshold is not None
            }
        )

    def detect_edges_canny(
        self,
        low_threshold: float = 50,
        high_threshold: float = 150
    ) -> EdgeDetectionResult:
        """
        Detect edges using Canny algorithm.

        Args:
            low_threshold: Lower boundary for hysteresis thresholding
            high_threshold: Upper boundary for hysteresis thresholding

        Returns:
            EdgeDetectionResult with detected edges
        """
        # Apply Canny edge detection
        edges = cv2.Canny(
            self.grayscale,
            threshold1=low_threshold,
            threshold2=high_threshold
        )

        # Count edge pixels
        edge_pixels = np.sum(edges > 0)
        edge_count = int(edge_pixels)
        edge_density = edge_count / (self.width * self.height)

        # Find strong edge points
        edge_indices = np.where(edges > 0)
        strong_edges = list(zip(edge_indices[1], edge_indices[0]))

        return EdgeDetectionResult(
            method='canny',
            edges=edges,
            edge_count=edge_count,
            edge_density=edge_density,
            strong_edges=strong_edges[:100],
            metadata={
                'low_threshold': low_threshold,
                'high_threshold': high_threshold
            }
        )

    def analyze_fourier(
        self,
        max_frequencies: int = 10
    ) -> FourierAnalysisResult:
        """
        Analyze periodic patterns using Fourier transform.

        Detects repeating structures in the image by analyzing
        the frequency domain. High magnitude at specific frequencies
        indicates periodic patterns.

        Args:
            max_frequencies: Maximum number of dominant frequencies to return

        Returns:
            FourierAnalysisResult with frequency domain analysis
        """
        # Apply 2D FFT
        f_transform = fft.fft2(self.grayscale)
        f_shift = fft.fftshift(f_transform)

        # Get magnitude spectrum
        magnitude = np.abs(f_shift)

        # Normalize for display/analysis
        magnitude_normalized = magnitude / np.max(magnitude)

        # Find dominant frequencies (excluding DC component at center)
        rows, cols = self.grayscale.shape
        center_row, center_col = rows // 2, cols // 2

        # Create mask to exclude DC component and low frequencies
        mask = np.ones_like(magnitude, dtype=bool)
        mask[center_row-5:center_row+5, center_col-5:center_col+5] = False

        # Find peaks in frequency domain
        masked_magnitude = magnitude_normalized.copy()
        masked_magnitude[~mask] = 0

        # Get indices of top frequencies
        flat_magnitude = masked_magnitude.flatten()
        top_indices = np.argpartition(flat_magnitude, -max_frequencies)[-max_frequencies:]

        # Convert back to 2D coordinates and then to frequency values
        dominant_freqs = []
        for idx in top_indices:
            if flat_magnitude[idx] > 0.01:  # Threshold for significance
                y, x = np.unravel_index(idx, magnitude.shape)
                # Convert to frequency (relative to center)
                freq_y = (y - center_row) / rows
                freq_x = (x - center_col) / cols
                dominant_freqs.append((freq_x, freq_y))

        # Find the dominant frequency (highest magnitude)
        if dominant_freqs:
            # Get the actual max frequency
            max_idx = np.unravel_index(np.argmax(masked_magnitude), magnitude.shape)
            dominant_frequency = (
                (max_idx[1] - center_col) / cols,
                (max_idx[0] - center_row) / rows
            )
        else:
            dominant_frequency = (0.0, 0.0)

        # Detect periodic regions
        # High magnitude away from DC indicates periodicity
        periodic_threshold = np.mean(masked_magnitude) + 2 * np.std(masked_magnitude)
        has_periodic = np.max(masked_magnitude) > periodic_threshold

        periodic_regions = []
        if has_periodic:
            # Find regions with significant frequency content
            binary_regions = masked_magnitude > periodic_threshold
            labeled, num_features = ndimage_label(binary_regions)

            for i in range(1, min(num_features + 1, max_frequencies)):
                region_mask = labeled == i
                region_magnitude = masked_magnitude[region_mask]
                center_of_mass = np.mean(np.argwhere(region_mask), axis=0)

                # Convert center of mass to frequency
                freq_y = (center_of_mass[0] - center_row) / rows
                freq_x = (center_of_mass[1] - center_col) / cols

                periodic_regions.append({
                    'frequency_x': float(freq_x),
                    'frequency_y': float(freq_y),
                    'magnitude': float(np.max(region_magnitude)),
                    'size_pixels': int(np.sum(region_mask))
                })

        # Sort by magnitude
        periodic_regions.sort(key=lambda x: x['magnitude'], reverse=True)

        return FourierAnalysisResult(
            frequencies=masked_magnitude,
            magnitude=magnitude_normalized,
            dominant_frequency=dominant_frequency,
            periodic_regions=periodic_regions[:max_frequencies],
            has_periodic_patterns=has_periodic
        )

    def detect_clusters(
        self,
        eps: float = 5.0,
        min_samples: int = 10,
        feature_type: str = "position"
    ) -> ClusterResult:
        """
        Detect clusters of similar pixels using DBSCAN.

        Args:
            eps: Maximum distance between samples in cluster
            min_samples: Minimum samples in cluster
            feature_type: "position" (spatial) or "color" (RGB similarity)

        Returns:
            ClusterResult with detected clusters
        """
        if feature_type == "position":
            return self._cluster_by_position(eps, min_samples)
        elif feature_type == "color":
            return self._cluster_by_color(eps, min_samples)
        else:
            raise ValueError(f"Unknown feature_type: {feature_type}")

    def _cluster_by_position(self, eps: float, min_samples: int) -> ClusterResult:
        """Cluster pixels by spatial position and brightness."""
        # Get bright pixels (above mean brightness)
        grayscale_normalized = self.grayscale.astype(np.float32) / 255.0
        mean_brightness = np.mean(grayscale_normalized)
        bright_mask = grayscale_normalized > mean_brightness

        # Get coordinates of bright pixels
        bright_coords = np.column_stack(np.where(bright_mask))

        if len(bright_coords) < min_samples:
            return ClusterResult(
                num_clusters=0,
                cluster_labels=np.array([]),
                cluster_centers=[],
                regions_of_interest=[],
                noise_points=len(bright_coords)
            )

        # Apply DBSCAN
        clustering = DBSCAN(eps=eps, min_samples=min_samples).fit(bright_coords)
        labels = clustering.labels_

        # Count clusters (noise is labeled -1)
        unique_labels = set(labels)
        n_clusters = len(unique_labels) - (1 if -1 in labels else 0)
        noise_count = np.sum(labels == -1)

        # Find cluster centers
        cluster_centers = []
        regions_of_interest = []

        for label in unique_labels:
            if label == -1:
                continue

            cluster_mask = labels == label
            cluster_points = bright_coords[cluster_mask]

            # Calculate center (mean of points)
            center = np.mean(cluster_points, axis=0)
            cluster_centers.append((float(center[1]), float(center[0])))  # (x, y)

            # Calculate bounding box
            min_y, min_x = np.min(cluster_points, axis=0)
            max_y, max_x = np.max(cluster_points, axis=0)

            # Calculate average brightness in cluster
            cluster_brightness = np.mean([
                grayscale_normalized[y, x]
                for y, x in cluster_points
            ])

            regions_of_interest.append({
                'cluster_id': int(label),
                'center_x': float(center[1]),
                'center_y': float(center[0]),
                'bounding_box': {
                    'min_x': int(min_x),
                    'max_x': int(max_x),
                    'min_y': int(min_y),
                    'max_y': int(max_y)
                },
                'pixel_count': int(np.sum(cluster_mask)),
                'avg_brightness': float(cluster_brightness)
            })

        return ClusterResult(
            num_clusters=n_clusters,
            cluster_labels=labels,
            cluster_centers=cluster_centers,
            regions_of_interest=regions_of_interest,
            noise_points=int(noise_count)
        )

    def _cluster_by_color(self, eps: float, min_samples: int) -> ClusterResult:
        """Cluster pixels by RGB color similarity."""
        # Reshape image to list of RGB pixels
        rgb_pixels = self.image[:, :, :3].reshape(-1, 3)

        # Apply DBSCAN on RGB values
        clustering = DBSCAN(eps=eps, min_samples=min_samples).fit(rgb_pixels)
        labels = clustering.labels_

        # Count clusters
        unique_labels = set(labels)
        n_clusters = len(unique_labels) - (1 if -1 in labels else 0)
        noise_count = np.sum(labels == -1)

        # Find cluster centers in RGB space
        cluster_centers = []
        regions_of_interest = []

        for label in unique_labels:
            if label == -1:
                continue

            cluster_mask = labels == label
            cluster_pixels = rgb_pixels[cluster_mask]

            # Mean RGB color
            mean_color = np.mean(cluster_pixels, axis=0)
            cluster_centers.append(tuple(mean_color))

            # Get spatial extent of this color cluster
            cluster_indices = np.where(cluster_mask.reshape(self.height, self.width))
            min_y, min_x = np.min(cluster_indices, axis=1)
            max_y, max_x = np.max(cluster_indices, axis=1)

            regions_of_interest.append({
                'cluster_id': int(label),
                'rgb_center': [float(c) for c in mean_color],
                'pixel_count': int(np.sum(cluster_mask)),
                'spatial_extent': {
                    'min_x': int(min_x),
                    'max_x': int(max_x),
                    'min_y': int(min_y),
                    'max_y': int(max_y)
                }
            })

        return ClusterResult(
            num_clusters=n_clusters,
            cluster_labels=labels,
            cluster_centers=cluster_centers,
            regions_of_interest=regions_of_interest,
            noise_points=int(noise_count)
        )


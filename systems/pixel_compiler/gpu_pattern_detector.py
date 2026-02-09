# gpu_pattern_detector.py
"""
GPU-accelerated Pattern Detector for PixelRTS Vision Analysis

Provides PyTorch-based GPU acceleration for computer vision algorithms
with automatic CPU fallback, timing metrics, and memory tracking.
"""

import numpy as np
from pathlib import Path
from typing import Dict, List, Tuple, Optional, Any, Union
from dataclasses import dataclass, field
import time
from collections import defaultdict

try:
    import torch
    import torch.fft
except ImportError:
    raise ImportError(
        "GPU pattern detection requires PyTorch. "
        "Install with: pip install torch"
    )

try:
    from PIL import Image
except ImportError:
    raise ImportError(
        "Pattern detection requires PIL/Pillow. "
        "Install with: pip install Pillow"
    )


@dataclass
class GpuEdgeDetectionResult:
    """Result of GPU-accelerated edge detection analysis."""
    method: str
    edges: np.ndarray
    edge_count: int
    edge_density: float
    strong_edges: List[Tuple[int, int]] = field(default_factory=list)
    timing_info: Dict[str, Any] = field(default_factory=dict)
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class GpuFourierAnalysisResult:
    """Result of GPU-accelerated Fourier transform analysis."""
    frequencies: np.ndarray
    magnitude: np.ndarray
    dominant_frequency: Tuple[float, float]
    periodic_regions: List[Dict[str, Any]]
    has_periodic_patterns: bool
    timing_info: Dict[str, Any] = field(default_factory=dict)


class GpuPatternDetector:
    """
    GPU-accelerated pattern detector for PixelRTS visual artifacts.

    Features:
    - Sobel edge detection on GPU with automatic CPU fallback
    - Canny edge detection using PyTorch operations
    - Fourier transform analysis for periodic pattern detection
    - Timing metrics for performance monitoring
    - Memory tracking for resource optimization
    - Automatic device selection (CUDA, MPS, or CPU)
    """

    def __init__(self, image_path: str, device: Union[str, torch.device] = 'auto'):
        """
        Initialize GPU pattern detector with an image.

        Args:
            image_path: Path to PNG image file
            device: Device to use ('auto', 'cuda', 'cpu', 'mps', or torch.device)

        Raises:
            ValueError: If device specification is invalid
        """
        self.image_path = image_path

        # Set device
        self.device = self._parse_device(device)

        # Load and convert image
        self._load_image()

        # Initialize timing and memory tracking
        self.timing_metrics: Dict[str, Dict[str, float]] = defaultdict(dict)

    def _parse_device(self, device: Union[str, torch.device]) -> torch.device:
        """
        Parse and validate device specification.

        Args:
            device: Device specification

        Returns:
            torch.device object

        Raises:
            ValueError: If device specification is invalid
        """
        if isinstance(device, torch.device):
            return device

        if device == 'auto':
            return self.get_optimal_device()

        # Validate device string
        valid_devices = ('cuda', 'cpu', 'mps')
        if device not in valid_devices:
            raise ValueError(
                f"Invalid device: {device}. Must be one of {valid_devices} or 'auto'"
            )

        # Check if device is available
        if device == 'cuda' and not torch.cuda.is_available():
            # Fallback to CPU
            return torch.device('cpu')
        elif device == 'mps' and not torch.backends.mps.is_available():
            # Fallback to CPU
            return torch.device('cpu')

        return torch.device(device)

    @staticmethod
    def get_optimal_device() -> torch.device:
        """
        Automatically select the optimal available device.

        Priority: CUDA > MPS > CPU

        Returns:
            torch.device object
        """
        if torch.cuda.is_available():
            return torch.device('cuda')
        elif torch.backends.mps.is_available():
            return torch.device('mps')
        else:
            return torch.device('cpu')

    def _load_image(self):
        """Load the image and convert to grayscale for analysis."""
        # Load with PIL
        pil_image = Image.open(self.image_path)

        # Ensure RGBA
        if pil_image.mode != 'RGBA':
            pil_image = pil_image.convert('RGBA')

        self.image = np.array(pil_image)
        self.height, self.width = self.image.shape[:2]

        # Convert to grayscale
        if len(self.image.shape) == 3:
            self.grayscale = (
                0.299 * self.image[:, :, 0] +
                0.587 * self.image[:, :, 1] +
                0.114 * self.image[:, :, 2]
            ).astype(np.uint8)
        else:
            self.grayscale = self.image

    def _track_timing(self, operation: str, execution_time_ms: float, memory_mb: float):
        """
        Track timing and memory metrics for an operation.

        Args:
            operation: Name of the operation
            execution_time_ms: Execution time in milliseconds
            memory_mb: Peak memory usage in MB
        """
        self.timing_metrics[operation] = {
            'execution_time_ms': execution_time_ms,
            'peak_memory_mb': memory_mb,
            'device': str(self.device)
        }

    def detect_edges_sobel_gpu(
        self,
        threshold: Optional[float] = None
    ) -> GpuEdgeDetectionResult:
        """
        Detect edges using GPU-accelerated Sobel operator.

        Implements Sobel edge detection using PyTorch convolutions,
        automatically falling back to CPU if GPU operations fail.

        Args:
            threshold: Optional threshold for edge binary classification.
                      If None, returns raw gradient magnitude.

        Returns:
            GpuEdgeDetectionResult with detected edges and timing info
        """
        start_time = time.time()
        start_memory = self._get_memory_usage()

        try:
            # Convert grayscale to tensor
            gray_tensor = torch.from_numpy(
                self.grayscale.astype(np.float32)
            ).to(self.device)

            # Reshape to (batch, channels, height, width)
            gray_tensor = gray_tensor.unsqueeze(0).unsqueeze(0)

            # Normalize to [0, 1]
            gray_tensor = gray_tensor / 255.0

            # Define Sobel kernels
            sobel_x_kernel = torch.tensor(
                [[-1, 0, 1],
                 [-2, 0, 2],
                 [-1, 0, 1]],
                dtype=torch.float32
            ).unsqueeze(0).unsqueeze(0).to(self.device)

            sobel_y_kernel = torch.tensor(
                [[-1, -2, -1],
                 [ 0,  0,  0],
                 [ 1,  2,  1]],
                dtype=torch.float32
            ).unsqueeze(0).unsqueeze(0).to(self.device)

            # Apply convolutions
            sobel_x = torch.nn.functional.conv2d(
                gray_tensor, sobel_x_kernel, padding=1
            )
            sobel_y = torch.nn.functional.conv2d(
                gray_tensor, sobel_y_kernel, padding=1
            )

            # Calculate gradient magnitude
            gradient_magnitude = torch.sqrt(sobel_x**2 + sobel_y**2)

            # Remove batch and channel dimensions
            gradient_magnitude = gradient_magnitude.squeeze()

            # Apply threshold if specified
            if threshold is not None:
                # Normalize threshold to [0, 1] range
                threshold_normalized = threshold / 255.0
                edges = (gradient_magnitude > threshold_normalized).float()
            else:
                edges = gradient_magnitude

            # Convert back to numpy and normalize to [0, 255]
            edges_np = edges.cpu().detach().numpy()
            gradient_np = gradient_magnitude.cpu().detach().numpy()

            # Normalize for output
            edges_np = (edges_np * 255).astype(np.uint8)

            # Count edge pixels
            edge_pixels = np.sum(edges_np > 0)
            edge_count = int(edge_pixels)
            edge_density = edge_count / (self.width * self.height)

            # Find strong edges (top 10% by magnitude)
            flat_gradient = gradient_np.flatten()
            nonzero_grad = flat_gradient[flat_gradient > 0]
            if len(nonzero_grad) > 0:
                strong_threshold = np.percentile(nonzero_grad * 255, 90)
            else:
                strong_threshold = 0

            strong_edge_indices = np.where(gradient_np * 255 >= strong_threshold)
            strong_edges = list(zip(
                strong_edge_indices[1],
                strong_edge_indices[0]
            ))[:100]

            end_time = time.time()
            end_memory = self._get_memory_usage()
            execution_time = (end_time - start_time) * 1000  # Convert to ms
            memory_used = max(0, end_memory - start_memory)

            # Track timing
            self._track_timing('sobel_gpu', execution_time, memory_used)

            return GpuEdgeDetectionResult(
                method='sobel_gpu',
                edges=edges_np,
                edge_count=edge_count,
                edge_density=edge_density,
                strong_edges=strong_edges,
                timing_info={
                    'execution_time_ms': execution_time,
                    'peak_memory_mb': memory_used,
                    'device': str(self.device)
                },
                metadata={
                    'gradient_mean': float(np.mean(gradient_np * 255)),
                    'gradient_std': float(np.std(gradient_np * 255)),
                    'gradient_max': float(np.max(gradient_np * 255)),
                    'threshold_applied': threshold is not None
                }
            )

        except Exception as e:
            # Fall back to CPU implementation if GPU fails
            if self.device.type != 'cpu':
                # Retry with CPU
                original_device = self.device
                self.device = torch.device('cpu')
                try:
                    result = self.detect_edges_sobel_gpu(threshold)
                    self.device = original_device
                    return result
                except:
                    self.device = original_device
            raise RuntimeError(f"GPU Sobel edge detection failed: {e}")

    def detect_edges_canny_gpu(
        self,
        low_threshold: float = 50,
        high_threshold: float = 150
    ) -> GpuEdgeDetectionResult:
        """
        Detect edges using GPU-accelerated Canny-like algorithm.

        Implements a simplified Canny edge detection using PyTorch operations.

        Args:
            low_threshold: Lower boundary for hysteresis thresholding
            high_threshold: Upper boundary for hysteresis thresholding

        Returns:
            GpuEdgeDetectionResult with detected edges and timing info
        """
        start_time = time.time()
        start_memory = self._get_memory_usage()

        try:
            # Convert grayscale to tensor
            gray_tensor = torch.from_numpy(
                self.grayscale.astype(np.float32)
            ).to(self.device)

            gray_tensor = gray_tensor.unsqueeze(0).unsqueeze(0)
            gray_tensor = gray_tensor / 255.0

            # Apply Gaussian smoothing
            gaussian_kernel = self._get_gaussian_kernel(kernel_size=5, sigma=1.4)
            gaussian_kernel = gaussian_kernel.unsqueeze(0).unsqueeze(0).to(self.device)
            smoothed = torch.nn.functional.conv2d(
                gray_tensor, gaussian_kernel, padding=2
            )

            # Compute gradients using Sobel
            sobel_x = torch.tensor(
                [[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]],
                dtype=torch.float32
            ).unsqueeze(0).unsqueeze(0).to(self.device)
            sobel_y = torch.tensor(
                [[-1, -2, -1], [0, 0, 0], [1, 2, 1]],
                dtype=torch.float32
            ).unsqueeze(0).unsqueeze(0).to(self.device)

            grad_x = torch.nn.functional.conv2d(smoothed, sobel_x, padding=1)
            grad_y = torch.nn.functional.conv2d(smoothed, sobel_y, padding=1)

            # Gradient magnitude and direction
            magnitude = torch.sqrt(grad_x**2 + grad_y**2).squeeze()
            direction = torch.atan2(grad_y, grad_x).squeeze()

            # Normalize thresholds
            low_thresh = low_threshold / 255.0
            high_thresh = high_threshold / 255.0

            # Non-maximum suppression
            suppressed = self._non_maximum_suppression(magnitude, direction)

            # Double thresholding
            strong_edges = suppressed > high_thresh
            weak_edges = (suppressed > low_thresh) & (suppressed <= high_thresh)

            # Hysteresis thresholding
            edges = self._hysteresis(strong_edges, weak_edges)

            edges_np = (edges.cpu().detach().numpy() * 255).astype(np.uint8)

            # Count edge pixels
            edge_pixels = np.sum(edges_np > 0)
            edge_count = int(edge_pixels)
            edge_density = edge_count / (self.width * self.height)

            # Find strong edge points
            edge_indices = np.where(edges_np > 0)
            strong_edges_list = list(zip(
                edge_indices[1],
                edge_indices[0]
            ))[:100]

            end_time = time.time()
            end_memory = self._get_memory_usage()
            execution_time = (end_time - start_time) * 1000
            memory_used = max(0, end_memory - start_memory)

            self._track_timing('canny_gpu', execution_time, memory_used)

            return GpuEdgeDetectionResult(
                method='canny_gpu',
                edges=edges_np,
                edge_count=edge_count,
                edge_density=edge_density,
                strong_edges=strong_edges_list,
                timing_info={
                    'execution_time_ms': execution_time,
                    'peak_memory_mb': memory_used,
                    'device': str(self.device)
                },
                metadata={
                    'low_threshold': low_threshold,
                    'high_threshold': high_threshold
                }
            )

        except Exception as e:
            if self.device.type != 'cpu':
                original_device = self.device
                self.device = torch.device('cpu')
                try:
                    result = self.detect_edges_canny_gpu(low_threshold, high_threshold)
                    self.device = original_device
                    return result
                except:
                    self.device = original_device
            raise RuntimeError(f"GPU Canny edge detection failed: {e}")

    def analyze_fourier_gpu(
        self,
        max_frequencies: int = 10
    ) -> GpuFourierAnalysisResult:
        """
        Analyze periodic patterns using GPU-accelerated Fourier transform.

        Uses PyTorch FFT operations for frequency domain analysis.

        Args:
            max_frequencies: Maximum number of dominant frequencies to return

        Returns:
            GpuFourierAnalysisResult with frequency domain analysis and timing
        """
        start_time = time.time()
        start_memory = self._get_memory_usage()

        try:
            # Convert grayscale to tensor
            gray_tensor = torch.from_numpy(
                self.grayscale.astype(np.float32)
            ).to(self.device)

            # Normalize to [0, 1]
            gray_tensor = gray_tensor / 255.0

            # Apply 2D FFT
            f_transform = torch.fft.fft2(gray_tensor)
            f_shift = torch.fft.fftshift(f_transform)

            # Get magnitude spectrum
            magnitude = torch.abs(f_shift)

            # Normalize
            magnitude_normalized = magnitude / torch.max(magnitude)

            # Find dominant frequencies
            rows, cols = gray_tensor.shape
            center_row, center_col = rows // 2, cols // 2

            # Create mask to exclude DC component
            mask = torch.ones_like(magnitude, dtype=torch.bool)
            mask[center_row-5:center_row+5, center_col-5:center_col+5] = False

            # Mask the DC component
            masked_magnitude = magnitude_normalized.clone()
            masked_magnitude[~mask] = 0

            # Convert to numpy for analysis (easier for peak finding)
            magnitude_np = masked_magnitude.cpu().detach().numpy()

            # Find top frequencies
            flat_magnitude = magnitude_np.flatten()
            top_indices = np.argpartition(
                flat_magnitude,
                -max_frequencies
            )[-max_frequencies:]

            dominant_freqs = []
            for idx in top_indices:
                if flat_magnitude[idx] > 0.01:
                    y, x = np.unravel_index(idx, magnitude_np.shape)
                    freq_y = (y - center_row) / rows
                    freq_x = (x - center_col) / cols
                    dominant_freqs.append((freq_x, freq_y))

            # Find dominant frequency
            if len(dominant_freqs) > 0:
                max_idx = np.unravel_index(
                    np.argmax(magnitude_np),
                    magnitude_np.shape
                )
                dominant_frequency = (
                    (max_idx[1] - center_col) / cols,
                    (max_idx[0] - center_row) / rows
                )
            else:
                dominant_frequency = (0.0, 0.0)

            # Detect periodic regions
            periodic_threshold = (
                np.mean(magnitude_np) + 2 * np.std(magnitude_np)
            )
            has_periodic = np.max(magnitude_np) > periodic_threshold

            periodic_regions = []
            if has_periodic:
                # Find significant frequency regions
                from scipy.ndimage import label as ndimage_label

                binary_regions = magnitude_np > periodic_threshold
                labeled, num_features = ndimage_label(binary_regions)

                for i in range(1, min(num_features + 1, max_frequencies)):
                    region_mask = labeled == i
                    region_magnitude = magnitude_np[region_mask]

                    if np.sum(region_mask) == 0:
                        continue

                    center_of_mass = np.mean(
                        np.argwhere(region_mask),
                        axis=0
                    )

                    freq_y = (center_of_mass[0] - center_row) / rows
                    freq_x = (center_of_mass[1] - center_col) / cols

                    periodic_regions.append({
                        'frequency_x': float(freq_x),
                        'frequency_y': float(freq_y),
                        'magnitude': float(np.max(region_magnitude)),
                        'size_pixels': int(np.sum(region_mask))
                    })

            # Sort by magnitude
            periodic_regions.sort(
                key=lambda x: x['magnitude'],
                reverse=True
            )

            end_time = time.time()
            end_memory = self._get_memory_usage()
            execution_time = (end_time - start_time) * 1000
            memory_used = max(0, end_memory - start_memory)

            self._track_timing('fourier_gpu', execution_time, memory_used)

            return GpuFourierAnalysisResult(
                frequencies=magnitude_np,
                magnitude=magnitude_normalized.cpu().detach().numpy(),
                dominant_frequency=dominant_frequency,
                periodic_regions=periodic_regions[:max_frequencies],
                has_periodic_patterns=has_periodic,
                timing_info={
                    'execution_time_ms': execution_time,
                    'peak_memory_mb': memory_used,
                    'device': str(self.device)
                }
            )

        except Exception as e:
            if self.device.type != 'cpu':
                original_device = self.device
                self.device = torch.device('cpu')
                try:
                    result = self.analyze_fourier_gpu(max_frequencies)
                    self.device = original_device
                    return result
                except:
                    self.device = original_device
            raise RuntimeError(f"GPU Fourier analysis failed: {e}")

    def get_performance_summary(self) -> Dict[str, Any]:
        """
        Get a summary of performance metrics for all operations.

        Returns:
            Dictionary containing performance summary
        """
        total_time = sum(
            metrics['execution_time_ms']
            for metrics in self.timing_metrics.values()
        )

        return {
            'device': str(self.device),
            'device_capabilities': {
                'cuda_available': torch.cuda.is_available(),
                'mps_available': torch.backends.mps.is_available()
            },
            'operations': dict(self.timing_metrics),
            'total_time_ms': total_time,
            'operation_count': len(self.timing_metrics)
        }

    def _get_memory_usage(self) -> float:
        """
        Get current memory usage in MB.

        Returns:
            Memory usage in megabytes
        """
        if self.device.type == 'cuda':
            return torch.cuda.memory_allocated() / (1024 ** 2)
        elif self.device.type == 'mps':
            # MPS memory tracking not directly available
            return 0.0
        else:
            # CPU memory - use process memory if available
            import psutil
            import os
            process = psutil.Process(os.getpid())
            return process.memory_info().rss / (1024 ** 2)

    def _get_gaussian_kernel(
        self,
        kernel_size: int = 5,
        sigma: float = 1.0
    ) -> torch.Tensor:
        """
        Generate a Gaussian kernel for smoothing.

        Args:
            kernel_size: Size of the kernel (must be odd)
            sigma: Standard deviation of the Gaussian

        Returns:
            Gaussian kernel as a 2D tensor
        """
        # Create 1D Gaussian
        ax = torch.arange(-kernel_size // 2 + 1., kernel_size // 2 + 1.)
        xx, yy = torch.meshgrid(ax, ax, indexing='ij')
        kernel = torch.exp(-(xx**2 + yy**2) / (2. * sigma**2))
        kernel = kernel / torch.sum(kernel)
        return kernel

    def _non_maximum_suppression(
        self,
        magnitude: torch.Tensor,
        direction: torch.Tensor
    ) -> torch.Tensor:
        """
        Apply non-maximum suppression for Canny edge detection.

        Args:
            magnitude: Gradient magnitude tensor
            direction: Gradient direction tensor

        Returns:
            Suppressed magnitude tensor
        """
        # Convert direction to angle in degrees
        angle = direction * 180.0 / torch.pi
        angle[angle < 0] += 180

        # Create output tensor
        suppressed = torch.zeros_like(magnitude)

        # Check neighbors in gradient direction
        height, width = magnitude.shape

        for i in range(1, height - 1):
            for j in range(1, width - 1):
                # Get current angle
                ang = angle[i, j]

                # Determine neighbor positions based on angle
                if (0 <= ang < 22.5) or (157.5 <= ang <= 180):
                    # Horizontal
                    prev_val = magnitude[i, j - 1]
                    next_val = magnitude[i, j + 1]
                elif 22.5 <= ang < 67.5:
                    # 45 degrees
                    prev_val = magnitude[i - 1, j + 1]
                    next_val = magnitude[i + 1, j - 1]
                elif 67.5 <= ang < 112.5:
                    # Vertical
                    prev_val = magnitude[i - 1, j]
                    next_val = magnitude[i + 1, j]
                else:
                    # 135 degrees
                    prev_val = magnitude[i - 1, j - 1]
                    next_val = magnitude[i + 1, j + 1]

                # Suppress if not a local maximum
                if magnitude[i, j] >= prev_val and magnitude[i, j] >= next_val:
                    suppressed[i, j] = magnitude[i, j]

        return suppressed

    def _hysteresis(
        self,
        strong_edges: torch.Tensor,
        weak_edges: torch.Tensor
    ) -> torch.Tensor:
        """
        Apply hysteresis thresholding for Canny edge detection.

        Args:
            strong_edges: Boolean tensor of strong edges
            weak_edges: Boolean tensor of weak edges

        Returns:
            Final edge detection result
        """
        # Start with strong edges
        edges = strong_edges.clone()

        # Iteratively add weak edges connected to strong edges
        height, width = strong_edges.shape

        # Simple connectivity check (8-connectivity)
        changed = True
        while changed:
            changed = False

            # Find weak edges adjacent to current edges
            padded = torch.nn.functional.pad(edges, (1, 1, 1, 1), mode='constant', value=0)

            for i in range(1, height + 1):
                for j in range(1, width + 1):
                    if weak_edges[i - 1, j - 1] and not edges[i - 1, j - 1]:
                        # Check 8 neighbors
                        neighbors = (
                            padded[i - 1:i + 2, j - 1:j + 2]
                        )
                        if torch.any(neighbors):
                            edges[i - 1, j - 1] = True
                            changed = True

        return edges

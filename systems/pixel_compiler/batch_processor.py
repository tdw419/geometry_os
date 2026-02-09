# batch_processor.py
"""
Batch Pattern Processor for PixelRTS Vision Analysis

Provides parallel processing of multiple images for pattern detection
using ThreadPoolExecutor for concurrent analysis.
"""

import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Dict, Any, Optional, Callable
import glob


@dataclass
class BatchResult:
    """Result of batch processing multiple images."""
    results: Dict[str, Dict[str, Any]] = field(default_factory=dict)
    total_images: int = 0
    successful: int = 0
    failed: int = 0
    processing_time: float = 0.0
    errors: List[str] = field(default_factory=list)

    def get_success_rate(self) -> float:
        """Calculate success rate as percentage."""
        if self.total_images == 0:
            return 0.0
        return (self.successful / self.total_images) * 100


class BatchPatternProcessor:
    """
    Process multiple images in parallel for pattern detection.

    Features:
    - Thread pool based parallel processing
    - Configurable worker count
    - Progress callbacks for monitoring
    - Directory scanning with glob patterns
    - Error handling and reporting
    - GPU/CPU device selection (for future GPU support)
    """

    def __init__(
        self,
        max_workers: Optional[int] = None,
        use_gpu: bool = True,
        device: str = 'auto'
    ):
        """
        Initialize the batch processor.

        Args:
            max_workers: Maximum number of worker threads. None uses CPU count.
            use_gpu: Whether to use GPU acceleration (for future use).
            device: Device to use ('auto', 'cpu', 'cuda').
        """
        self.max_workers = max_workers
        self.use_gpu = use_gpu
        self.device = device

        # Lazy import to avoid hard dependency
        self._pattern_detector = None

    def _get_pattern_detector(self):
        """Lazy import of PatternDetector."""
        if self._pattern_detector is None:
            from pattern_detector import PatternDetector
            self._pattern_detector = PatternDetector
        return self._pattern_detector

    def process_batch(
        self,
        image_paths: List[str],
        methods: List[str],
        progress_callback: Optional[Callable[[int, int, str], None]] = None
    ) -> BatchResult:
        """
        Process a batch of images with specified detection methods.

        Args:
            image_paths: List of paths to image files.
            methods: List of detection methods to apply.
                    Supported: 'sobel', 'canny', 'fourier', 'cluster_position', 'cluster_color'.
            progress_callback: Optional callback(current, total, image_path) for progress updates.

        Returns:
            BatchResult containing all analysis results.
        """
        start_time = time.time()
        result = BatchResult(total_images=len(image_paths))

        # Process images in parallel
        with ThreadPoolExecutor(max_workers=self.max_workers) as executor:
            # Submit all tasks
            future_to_path = {
                executor.submit(self._process_single_image, path, methods): path
                for path in image_paths
            }

            # Collect results as they complete
            completed = 0
            for future in as_completed(future_to_path):
                image_path = future_to_path[future]
                completed += 1

                try:
                    image_result = future.result()
                    result.results[image_path] = image_result

                    if 'error' in image_result:
                        result.failed += 1
                        result.errors.append(f"{image_path}: {image_result['error']}")
                    else:
                        result.successful += 1

                except Exception as e:
                    result.failed += 1
                    result.results[image_path] = {'error': str(e)}
                    result.errors.append(f"{image_path}: {str(e)}")

                # Call progress callback if provided
                if progress_callback:
                    progress_callback(completed, len(image_paths), image_path)

        result.processing_time = time.time() - start_time
        return result

    def process_directory(
        self,
        directory: str,
        pattern: str,
        methods: List[str],
        progress_callback: Optional[Callable[[int, int, str], None]] = None,
        recursive: bool = False
    ) -> BatchResult:
        """
        Process all images in a directory matching a glob pattern.

        Args:
            directory: Path to directory containing images.
            pattern: Glob pattern for matching files (e.g., '*.png', '*.rts.png', '**/*.png').
            methods: List of detection methods to apply.
            progress_callback: Optional callback for progress updates.
            recursive: Whether to search recursively (for ** patterns).

        Returns:
            BatchResult containing all analysis results.
        """
        dir_path = Path(directory)

        # Use glob to find matching files
        if recursive or '**' in pattern:
            # Use rglob for recursive matching
            if '**/' in pattern:
                # Pattern already has recursive component
                search_pattern = pattern.split('**/')[-1]
                image_paths = [str(p) for p in dir_path.rglob(search_pattern)]
            else:
                image_paths = [str(p) for p in dir_path.glob(pattern)]
        else:
            image_paths = [str(p) for p in dir_path.glob(pattern)]

        # Filter to only image files
        image_paths = [
            p for p in image_paths
            if Path(p).suffix.lower() in {'.png', '.jpg', '.jpeg', '.bmp', '.tiff', '.tif'}
        ]

        return self.process_batch(image_paths, methods, progress_callback)

    def _process_single_image(
        self,
        image_path: str,
        methods: List[str]
    ) -> Dict[str, Any]:
        """
        Process a single image with all specified methods.

        Args:
            image_path: Path to the image file.
            methods: List of detection methods to apply.

        Returns:
            Dictionary mapping method names to their results.
        """
        result = {}

        try:
            # Create detector instance
            PatternDetector = self._get_pattern_detector()
            detector = PatternDetector(image_path)

            # Apply each detection method
            for method in methods:
                try:
                    method_result = self._apply_method(detector, method)
                    result[method] = self._serialize_result(method_result)
                except Exception as e:
                    result[method] = {'error': str(e)}

        except Exception as e:
            result = {'error': str(e)}

        return result

    def _apply_method(self, detector, method: str):
        """
        Apply a specific detection method to the detector.

        Args:
            detector: PatternDetector instance.
            method: Method name to apply.

        Returns:
            Detection result object.
        """
        method_handlers = {
            'sobel': lambda: detector.detect_edges_sobel(),
            'canny': lambda: detector.detect_edges_canny(),
            'fourier': lambda: detector.analyze_fourier(),
            'cluster_position': lambda: detector.detect_clusters(feature_type="position"),
            'cluster_color': lambda: detector.detect_clusters(feature_type="color"),
        }

        if method not in method_handlers:
            raise ValueError(f"Unknown method: {method}. Available: {list(method_handlers.keys())}")

        return method_handlers[method]()

    def _serialize_result(self, result: Any) -> Dict[str, Any]:
        """
        Serialize detection result to JSON-compatible dictionary.

        Args:
            result: Detection result object (EdgeDetectionResult, FourierAnalysisResult, etc.).

        Returns:
            JSON-serializable dictionary.
        """
        # Handle dataclass results
        if hasattr(result, '__dataclass_fields__'):
            serialized = {}
            for field_name in result.__dataclass_fields__:
                value = getattr(result, field_name)

                # Convert numpy arrays to list
                if hasattr(value, 'tolist'):
                    serialized[field_name] = value.tolist()
                # Handle nested dataclasses or lists of tuples
                elif isinstance(value, list) and value and isinstance(value[0], tuple):
                    serialized[field_name] = [list(item) for item in value]
                else:
                    serialized[field_name] = value

            return serialized

        # Fallback for other types
        return {'result': str(result)}


def create_batch_processor(
    max_workers: Optional[int] = None,
    use_gpu: bool = True,
    device: str = 'auto'
) -> BatchPatternProcessor:
    """
    Factory function to create a BatchPatternProcessor.

    Args:
        max_workers: Maximum number of worker threads.
        use_gpu: Whether to use GPU acceleration.
        device: Device to use ('auto', 'cpu', 'cuda').

    Returns:
        Configured BatchPatternProcessor instance.
    """
    return BatchPatternProcessor(
        max_workers=max_workers,
        use_gpu=use_gpu,
        device=device
    )

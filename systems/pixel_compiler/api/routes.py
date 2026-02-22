"""
API route handlers for Pattern Detection REST API

Handles HTTP requests and delegates to appropriate services.
"""
import base64
import io
import json
import tempfile
import time
from pathlib import Path
from typing import List, Optional

from fastapi import UploadFile, File, Form, HTTPException
from fastapi.responses import JSONResponse
from PIL import Image
import numpy as np

from .models import (
    AnalysisRequest,
    AnalysisResponse,
    AnalysisResults,
    BatchResponse,
    BatchFileResult,
    EdgeDetectionResult,
    FourierAnalysisResult,
    ClusterResult,
    FourierRegion,
    RegionOfInterest,
    BoundingBox,
    ModelInfo,
    ModelsResponse,
    HealthResponse,
    EdgeMethod,
    AnalysisMethod,
)


# Import PatternDetector
try:
    from systems.pixel_compiler.pattern_detector import PatternDetector
except ImportError:
    PatternDetector = None


def get_available_models() -> ModelsResponse:
    """Get list of available analysis models and methods."""
    models = [
        ModelInfo(
            name="sobel",
            type="edge_detection",
            description="Sobel operator for gradient-based edge detection",
            parameters={
                "threshold": {"type": "float", "optional": True, "range": "[0, 255]"}
            }
        ),
        ModelInfo(
            name="canny",
            type="edge_detection",
            description="Canny algorithm for multi-stage edge detection",
            parameters={
                "low_threshold": {"type": "float", "default": 50, "range": "[0, 255]"},
                "high_threshold": {"type": "float", "default": 150, "range": "[0, 255]"}
            }
        ),
        ModelInfo(
            name="fourier",
            type="frequency_analysis",
            description="Fourier transform for periodic pattern detection",
            parameters={
                "max_frequencies": {"type": "int", "default": 10}
            }
        ),
        ModelInfo(
            name="dbscan",
            type="clustering",
            description="DBSCAN clustering for region of interest detection",
            parameters={
                "eps": {"type": "float", "default": 5.0},
                "min_samples": {"type": "int", "default": 10},
                "feature_type": {"type": "str", "default": "position", "options": ["position", "color"]}
            }
        ),
    ]
    return ModelsResponse(models=models)


def get_health() -> HealthResponse:
    """Get API health status."""
    status = "ok" if PatternDetector is not None else "degraded"

    dependencies = {}
    try:
        import cv2
        dependencies["opencv"] = cv2.__version__
    except ImportError:
        dependencies["opencv"] = "not installed"

    try:
        import sklearn
        dependencies["scikit-learn"] = sklearn.__version__
    except ImportError:
        dependencies["scikit-learn"] = "not installed"

    try:
        import scipy
        dependencies["scipy"] = scipy.__version__
    except ImportError:
        dependencies["scipy"] = "not installed"

    return HealthResponse(
        status=status,
        version="1.0.0",
        dependencies=dependencies
    )


def array_to_base64(array: np.ndarray, colormap: bool = False) -> Optional[str]:
    """Convert numpy array to base64 encoded PNG."""
    import cv2

    if colormap:
        # Apply colormap for visualization
        array = cv2.applyColorMap(array, cv2.COLORMAP_JET)

    # Convert to bytes
    is_success, buffer = cv2.imencode(".png", array)
    if not is_success:
        return None

    # Encode to base64
    return base64.b64encode(buffer).decode("utf-8")


async def analyze_image(
    file: UploadFile,
    methods: List[str],
    edge_method: str = "sobel",
    return_overlay: bool = False,
    canny_low_threshold: float = 50.0,
    canny_high_threshold: float = 150.0,
    sobel_threshold: Optional[float] = None,
    cluster_eps: float = 5.0,
    cluster_min_samples: int = 10,
    cluster_feature_type: str = "position",
) -> AnalysisResponse:
    """
    Analyze a single image with requested methods.

    Args:
        file: Uploaded image file
        methods: List of analysis methods to apply
        edge_method: Edge detection method (sobel or canny)
        return_overlay: Whether to return base64 encoded overlay images
        canny_low_threshold: Canny low threshold
        canny_high_threshold: Canny high threshold
        sobel_threshold: Sobel threshold for binary classification
        cluster_eps: DBSCAN epsilon parameter
        cluster_min_samples: DBSCAN minimum samples
        cluster_feature_type: Clustering feature type

    Returns:
        AnalysisResponse with results
    """
    start_time = time.time()

    if PatternDetector is None:
        return AnalysisResponse(
            success=False,
            image_path=file.filename,
            error="PatternDetector not available. Required dependencies may be missing."
        )

    # Validate file type
    if not file.content_type or not file.content_type.startswith("image/"):
        raise HTTPException(
            status_code=400,
            detail=f"Invalid file type: {file.content_type}. Expected an image."
        )

    # Validate methods
    valid_methods = {"edges", "fourier", "clusters"}
    invalid = set(methods) - valid_methods
    if invalid:
        raise HTTPException(
            status_code=400,
            detail=f"Invalid analysis methods: {', '.join(invalid)}. "
                   f"Valid methods: {', '.join(valid_methods)}"
        )

    # Save uploaded file to temp location
    temp_file = None
    try:
        # Read file content
        content = await file.read()

        # Verify it's a valid image by trying to open it
        try:
            img = Image.open(io.BytesIO(content))
            img.verify()
        except Exception as e:
            return AnalysisResponse(
                success=False,
                image_path=file.filename,
                error=f"Invalid image file: {str(e)}"
            )

        # Create temp file for PatternDetector
        with tempfile.NamedTemporaryFile(delete=False, suffix=".png") as temp_file:
            temp_file.write(content)
            temp_path = temp_file.name

        # Run pattern detection
        detector = PatternDetector(temp_path)
        results = AnalysisResults()

        # Edge detection
        if "edges" in methods:
            try:
                if edge_method == "sobel":
                    edge_result = detector.detect_edges_sobel(threshold=sobel_threshold)
                else:  # canny
                    edge_result = detector.detect_edges_canny(
                        low_threshold=canny_low_threshold,
                        high_threshold=canny_high_threshold
                    )

                # Convert strong edges from tuples to dicts
                strong_edges_dicts = [
                    {"x": x, "y": y} for x, y in edge_result.strong_edges
                ]

                overlay_base64 = None
                if return_overlay:
                    overlay_base64 = array_to_base64(edge_result.edges, colormap=True)

                results.edges = EdgeDetectionResult(
                    method=edge_result.method,
                    edge_count=edge_result.edge_count,
                    edge_density=edge_result.edge_density,
                    strong_edges=strong_edges_dicts,
                    metadata=edge_result.metadata,
                    overlay=overlay_base64
                )
            except Exception as e:
                raise HTTPException(
                    status_code=500,
                    detail=f"Edge detection failed: {str(e)}"
                )

        # Fourier analysis
        if "fourier" in methods:
            try:
                fourier_result = detector.analyze_fourier(max_frequencies=10)

                periodic_regions = [
                    FourierRegion(
                        frequency_x=r["frequency_x"],
                        frequency_y=r["frequency_y"],
                        magnitude=r["magnitude"],
                        size_pixels=r["size_pixels"]
                    )
                    for r in fourier_result.periodic_regions
                ]

                overlay_base64 = None
                if return_overlay:
                    # Convert magnitude to uint8 for visualization
                    magnitude_vis = (fourier_result.magnitude * 255).astype(np.uint8)
                    overlay_base64 = array_to_base64(magnitude_vis, colormap=True)

                results.fourier = FourierAnalysisResult(
                    dominant_frequency={
                        "x": fourier_result.dominant_frequency[0],
                        "y": fourier_result.dominant_frequency[1]
                    },
                    periodic_regions=periodic_regions,
                    has_periodic_patterns=fourier_result.has_periodic_patterns,
                    overlay=overlay_base64
                )
            except Exception as e:
                raise HTTPException(
                    status_code=500,
                    detail=f"Fourier analysis failed: {str(e)}"
                )

        # Clustering
        if "clusters" in methods:
            try:
                cluster_result = detector.detect_clusters(
                    eps=cluster_eps,
                    min_samples=cluster_min_samples,
                    feature_type=cluster_feature_type
                )

                regions = []
                for r in cluster_result.regions_of_interest:
                    if "bounding_box" in r:
                        bbox = BoundingBox(**r["bounding_box"])
                    else:
                        bbox = None

                    region = RegionOfInterest(
                        cluster_id=r["cluster_id"],
                        center_x=r.get("center_x"),
                        center_y=r.get("center_y"),
                        rgb_center=r.get("rgb_center"),
                        bounding_box=bbox,
                        pixel_count=r["pixel_count"],
                        avg_brightness=r.get("avg_brightness")
                    )
                    regions.append(region)

                cluster_centers_dicts = []
                for center in cluster_result.cluster_centers:
                    if isinstance(center, tuple) and len(center) == 2:
                        cluster_centers_dicts.append({"x": center[0], "y": center[1]})

                overlay_base64 = None
                if return_overlay and len(cluster_result.cluster_labels) > 0:
                    # Create colored overlay showing clusters
                    overlay_base64 = None  # Could implement cluster visualization

                results.clusters = ClusterResult(
                    num_clusters=cluster_result.num_clusters,
                    cluster_centers=cluster_centers_dicts,
                    regions_of_interest=regions,
                    noise_points=cluster_result.noise_points,
                    overlay=overlay_base64
                )
            except Exception as e:
                raise HTTPException(
                    status_code=500,
                    detail=f"Clustering failed: {str(e)}"
                )

        processing_time = (time.time() - start_time) * 1000

        return AnalysisResponse(
            success=True,
            image_path=file.filename,
            results=results,
            processing_time_ms=processing_time
        )

    except HTTPException:
        raise
    except Exception as e:
        return AnalysisResponse(
            success=False,
            image_path=file.filename,
            error=f"Analysis failed: {str(e)}"
        )
    finally:
        # Clean up temp file
        if temp_file and Path(temp_path).exists():
            try:
                Path(temp_path).unlink()
            except Exception:
                pass


async def analyze_batch(
    files: List[UploadFile],
    methods: List[str],
    edge_method: str = "sobel",
    return_overlay: bool = False,
    canny_low_threshold: float = 50.0,
    canny_high_threshold: float = 150.0,
    sobel_threshold: Optional[float] = None,
    cluster_eps: float = 5.0,
    cluster_min_samples: int = 10,
    cluster_feature_type: str = "position",
) -> BatchResponse:
    """
    Analyze multiple images in batch.

    Args:
        files: List of uploaded image files
        methods: List of analysis methods to apply
        edge_method: Edge detection method (sobel or canny)
        return_overlay: Whether to return base64 encoded overlay images
        canny_low_threshold: Canny low threshold
        canny_high_threshold: Canny high threshold
        sobel_threshold: Sobel threshold for binary classification
        cluster_eps: DBSCAN epsilon parameter
        cluster_min_samples: DBSCAN minimum samples
        cluster_feature_type: Clustering feature type

    Returns:
        BatchResponse with results for each file
    """
    start_time = time.time()
    results = []

    for file in files:
        result = await analyze_image(
            file=file,
            methods=methods,
            edge_method=edge_method,
            return_overlay=return_overlay,
            canny_low_threshold=canny_low_threshold,
            canny_high_threshold=canny_high_threshold,
            sobel_threshold=sobel_threshold,
            cluster_eps=cluster_eps,
            cluster_min_samples=cluster_min_samples,
            cluster_feature_type=cluster_feature_type,
        )

        results.append(BatchFileResult(
            file_name=file.filename or "unknown",
            success=result.success,
            results=result.results,
            error=result.error
        ))

    processing_time = (time.time() - start_time) * 1000
    successful = sum(1 for r in results if r.success)
    failed = len(results) - successful

    return BatchResponse(
        success=failed == 0,
        results=results,
        total_files=len(results),
        successful=successful,
        failed=failed,
        processing_time_ms=processing_time
    )

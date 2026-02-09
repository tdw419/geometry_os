"""
Pattern Detection REST API

FastAPI application for analyzing images using pattern detection algorithms
including edge detection, Fourier analysis, and clustering.
"""
import json
from typing import List, Optional

from fastapi import FastAPI, File, Form, UploadFile, HTTPException
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware

from .models import (
    AnalysisRequest,
    AnalysisResponse,
    BatchResponse,
    ModelsResponse,
    HealthResponse,
    AnalysisMethod,
    EdgeMethod,
)
from .routes import (
    get_health,
    get_available_models,
    analyze_image,
    analyze_batch,
)


# Create FastAPI app
app = FastAPI(
    title="Pattern Detection API",
    description="REST API for analyzing images using pattern detection algorithms",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, specify exact origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health", response_model=HealthResponse, tags=["Health"])
async def health_check():
    """
    Health check endpoint.

    Returns API status and version information.
    """
    return get_health()


@app.get("/api/v1/models", response_model=ModelsResponse, tags=["Models"])
async def list_models():
    """
    List available analysis models and methods.

    Returns information about supported algorithms and their parameters.
    """
    return get_available_models()


@app.post("/api/v1/analyze", response_model=AnalysisResponse, tags=["Analysis"])
async def analyze(
    file: UploadFile = File(..., description="Image file to analyze"),
    methods: str = Form(..., description="JSON array of analysis methods"),
    edge_method: str = Form("sobel", description="Edge detection method (sobel or canny)"),
    return_overlay: str = Form("false", description="Return base64 overlay images"),
    canny_low_threshold: float = Form(50.0, description="Canny low threshold"),
    canny_high_threshold: float = Form(150.0, description="Canny high threshold"),
    sobel_threshold: Optional[float] = Form(None, description="Sobel threshold"),
    cluster_eps: float = Form(5.0, description="DBSCAN epsilon"),
    cluster_min_samples: int = Form(10, description="DBSCAN min samples"),
    cluster_feature_type: str = Form("position", description="Clustering feature type"),
):
    """
    Analyze a single image with requested pattern detection methods.

    Supported methods:
    - `edges`: Edge detection (sobel or canny)
    - `fourier`: Fourier transform for periodic pattern detection
    - `clusters`: DBSCAN clustering for region of interest detection

    Example request:
    ```
    methods: ["edges", "fourier"]
    edge_method: "sobel"
    return_overlay: "true"
    ```
    """
    # Parse methods JSON
    try:
        methods_list = json.loads(methods)
    except json.JSONDecodeError:
        raise HTTPException(
            status_code=400,
            detail=f"Invalid JSON in methods parameter: {methods}"
        )

    # Parse return_overlay
    return_overlay_bool = return_overlay.lower() in ("true", "1", "yes", "on")

    return await analyze_image(
        file=file,
        methods=methods_list,
        edge_method=edge_method,
        return_overlay=return_overlay_bool,
        canny_low_threshold=canny_low_threshold,
        canny_high_threshold=canny_high_threshold,
        sobel_threshold=sobel_threshold,
        cluster_eps=cluster_eps,
        cluster_min_samples=cluster_min_samples,
        cluster_feature_type=cluster_feature_type,
    )


@app.post("/api/v1/batch", response_model=BatchResponse, tags=["Analysis"])
async def batch_analyze(
    files: List[UploadFile] = File(..., description="Multiple image files to analyze"),
    methods: str = Form(..., description="JSON array of analysis methods"),
    edge_method: str = Form("sobel", description="Edge detection method (sobel or canny)"),
    return_overlay: str = Form("false", description="Return base64 overlay images"),
    canny_low_threshold: float = Form(50.0, description="Canny low threshold"),
    canny_high_threshold: float = Form(150.0, description="Canny high threshold"),
    sobel_threshold: Optional[float] = Form(None, description="Sobel threshold"),
    cluster_eps: float = Form(5.0, description="DBSCAN epsilon"),
    cluster_min_samples: int = Form(10, description="DBSCAN min samples"),
    cluster_feature_type: str = Form("position", description="Clustering feature type"),
):
    """
    Analyze multiple images in batch.

    Processes each image independently and returns results for all files.
    """
    # Parse methods JSON
    try:
        methods_list = json.loads(methods)
    except json.JSONDecodeError:
        raise HTTPException(
            status_code=400,
            detail=f"Invalid JSON in methods parameter: {methods}"
        )

    # Parse return_overlay
    return_overlay_bool = return_overlay.lower() in ("true", "1", "yes", "on")

    return await analyze_batch(
        files=files,
        methods=methods_list,
        edge_method=edge_method,
        return_overlay=return_overlay_bool,
        canny_low_threshold=canny_low_threshold,
        canny_high_threshold=canny_high_threshold,
        sobel_threshold=sobel_threshold,
        cluster_eps=cluster_eps,
        cluster_min_samples=cluster_min_samples,
        cluster_feature_type=cluster_feature_type,
    )


@app.exception_handler(HTTPException)
async def http_exception_handler(request, exc):
    """Custom exception handler for HTTP exceptions."""
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "success": False,
            "error": exc.detail,
            "status_code": exc.status_code
        }
    )


@app.exception_handler(Exception)
async def general_exception_handler(request, exc):
    """Custom exception handler for general exceptions."""
    return JSONResponse(
        status_code=500,
        content={
            "success": False,
            "error": f"Internal server error: {str(exc)}",
            "status_code": 500
        }
    )


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)

"""
Pydantic models for Pattern Detection REST API

Defines request and response schemas for the API.
"""
from enum import Enum
from typing import Any

from pydantic import BaseModel, Field


class EdgeMethod(str, Enum):
    """Edge detection methods supported."""
    SOBEL = "sobel"
    CANNY = "canny"


class AnalysisMethod(str, Enum):
    """Analysis methods supported."""
    EDGES = "edges"
    FOURIER = "fourier"
    CLUSTERS = "clusters"


class AnalysisRequest(BaseModel):
    """Request model for image analysis."""
    methods: list[AnalysisMethod] = Field(
        ...,
        description="List of analysis methods to apply"
    )
    edge_method: EdgeMethod = Field(
        default=EdgeMethod.SOBEL,
        description="Edge detection method to use (if 'edges' in methods)"
    )
    return_overlay: bool = Field(
        default=False,
        description="Whether to return overlay images as base64"
    )
    canny_low_threshold: float = Field(
        default=50.0,
        ge=0,
        le=255,
        description="Canny low threshold (if edge_method is canny)"
    )
    canny_high_threshold: float = Field(
        default=150.0,
        ge=0,
        le=255,
        description="Canny high threshold (if edge_method is canny)"
    )
    sobel_threshold: float | None = Field(
        default=None,
        ge=0,
        le=255,
        description="Sobel threshold for binary classification"
    )
    cluster_eps: float = Field(
        default=5.0,
        ge=0.1,
        description="DBSCAN epsilon parameter"
    )
    cluster_min_samples: int = Field(
        default=10,
        ge=1,
        description="DBSCAN minimum samples parameter"
    )
    cluster_feature_type: str = Field(
        default="position",
        pattern="^(position|color)$",
        description="Clustering feature type"
    )


class EdgeDetectionResult(BaseModel):
    """Result of edge detection analysis."""
    method: str
    edge_count: int
    edge_density: float
    strong_edges: list[dict[str, int]] = Field(default_factory=list)
    metadata: dict[str, Any] = Field(default_factory=dict)
    overlay: str | None = Field(None, description="Base64 encoded overlay image")


class FourierRegion(BaseModel):
    """A periodic region found by Fourier analysis."""
    frequency_x: float
    frequency_y: float
    magnitude: float
    size_pixels: int


class FourierAnalysisResult(BaseModel):
    """Result of Fourier transform analysis."""
    dominant_frequency: dict[str, float]
    periodic_regions: list[FourierRegion]
    has_periodic_patterns: bool
    overlay: str | None = Field(None, description="Base64 encoded frequency magnitude image")


class BoundingBox(BaseModel):
    """Bounding box for a region."""
    min_x: int
    max_x: int
    min_y: int
    max_y: int


class RegionOfInterest(BaseModel):
    """A region of interest from clustering."""
    cluster_id: int
    center_x: float | None = None
    center_y: float | None = None
    rgb_center: list[float] | None = None
    bounding_box: BoundingBox | None = None
    pixel_count: int
    avg_brightness: float | None = None


class ClusterResult(BaseModel):
    """Result of clustering analysis."""
    num_clusters: int
    cluster_centers: list[dict[str, float]] = Field(default_factory=list)
    regions_of_interest: list[RegionOfInterest]
    noise_points: int
    overlay: str | None = Field(None, description="Base64 encoded clustered image")


class AnalysisResults(BaseModel):
    """Combined analysis results."""
    edges: EdgeDetectionResult | None = None
    fourier: FourierAnalysisResult | None = None
    clusters: ClusterResult | None = None


class AnalysisResponse(BaseModel):
    """Response model for image analysis."""
    success: bool
    image_path: str | None = None
    results: AnalysisResults | None = None
    error: str | None = None
    processing_time_ms: float | None = None


class BatchFileResult(BaseModel):
    """Result for a single file in batch processing."""
    file_name: str
    success: bool
    results: AnalysisResults | None = None
    error: str | None = None


class BatchResponse(BaseModel):
    """Response model for batch processing."""
    success: bool
    results: list[BatchFileResult]
    total_files: int
    successful: int
    failed: int
    processing_time_ms: float | None = None


class ModelInfo(BaseModel):
    """Information about an available model/method."""
    name: str
    type: str
    description: str
    parameters: dict[str, Any] = Field(default_factory=dict)


class ModelsResponse(BaseModel):
    """Response model for listing available models."""
    models: list[ModelInfo]


class HealthResponse(BaseModel):
    """Response model for health check."""
    status: str
    version: str
    dependencies: dict[str, str] = Field(default_factory=dict)

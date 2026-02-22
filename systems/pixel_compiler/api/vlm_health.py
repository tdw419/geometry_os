"""
VLM Health Monitoring REST API Router

Provides endpoints for monitoring Vision Language Model (VLM) health,
including health checks, baseline management, and monitoring control.
"""
from typing import Optional, Dict, Any
from datetime import datetime, timezone
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field


def utcnow() -> datetime:
    """Get current UTC datetime (timezone-aware)."""
    return datetime.now(timezone.utc)


# Pydantic models for VLM Health API
class VLMHealthCheckResponse(BaseModel):
    """Response model for VLM health check."""
    status: str = Field(..., description="Health status: healthy, degraded, or unhealthy")
    is_healthy: bool = Field(..., description="Overall health indicator")
    model_info: Optional[Dict[str, Any]] = Field(None, description="Model information")
    checks: Dict[str, bool] = Field(default_factory=dict, description="Individual health checks")
    timestamp: str = Field(default_factory=lambda: utcnow().isoformat())


class VLMBaselineResponse(BaseModel):
    """Response model for baseline operations."""
    success: bool
    baseline: Optional[Dict[str, Any]] = None
    message: Optional[str] = None
    timestamp: str = Field(default_factory=lambda: utcnow().isoformat())


class VLMMonitorResponse(BaseModel):
    """Response model for monitoring control operations."""
    success: bool
    monitoring: bool
    message: Optional[str] = None
    timestamp: str = Field(default_factory=lambda: utcnow().isoformat())


class VLMMonitorStatusResponse(BaseModel):
    """Response model for monitoring status."""
    monitoring: bool
    checks_performed: int = 0
    last_check: Optional[str] = None
    health_score: Optional[float] = None
    uptime_seconds: Optional[float] = None
    timestamp: str = Field(default_factory=lambda: utcnow().isoformat())


# Mock VLMHealthManager - in production, this would import from actual module
class VLMHealthManager:
    """
    Mock VLM Health Manager for testing purposes.

    In production, this would be imported from the actual VLM health monitoring module.
    """

    def __init__(self):
        self._monitoring = False
        self._baseline = {
            "accuracy": 0.95,
            "latency_ms": 100.0,
            "memory_mb": 512.0,
            "throughput_per_second": 10.0
        }
        self._checks_count = 0
        self._last_check = None
        self._start_time = None

    def check_health(self) -> Dict[str, Any]:
        """Perform VLM health check."""
        return {
            "status": "healthy",
            "is_healthy": True,
            "model_info": {
                "name": "mock-vlm-model",
                "version": "1.0.0",
                "provider": "mock"
            },
            "checks": {
                "memory": True,
                "latency": True,
                "accuracy": True,
                "api_available": True
            }
        }

    def get_baseline(self) -> Dict[str, Any]:
        """Get current health baseline."""
        return self._baseline.copy()

    def set_baseline(self, baseline: Dict[str, Any]) -> None:
        """Set new health baseline."""
        self._baseline = baseline.copy()

    def is_monitoring(self) -> bool:
        """Check if monitoring is active."""
        return self._monitoring

    def start_monitoring(self) -> None:
        """Start health monitoring."""
        self._monitoring = True
        self._start_time = utcnow()

    def stop_monitoring(self) -> None:
        """Stop health monitoring."""
        self._monitoring = False

    def get_status(self) -> Dict[str, Any]:
        """Get monitoring status."""
        status = {
            "monitoring": self._monitoring,
            "checks_performed": self._checks_count,
            "last_check": self._last_check.isoformat() if self._last_check else None,
            "health_score": 0.95
        }
        if self._start_time and self._monitoring:
            uptime = (utcnow() - self._start_time).total_seconds()
            status["uptime_seconds"] = uptime
        return status


# Global health manager instance
_health_manager: Optional[VLMHealthManager] = None


def get_health_manager() -> VLMHealthManager:
    """Get or create the global VLM health manager instance."""
    global _health_manager
    if _health_manager is None:
        _health_manager = VLMHealthManager()
    return _health_manager


# Create FastAPI router
router = APIRouter(
    prefix="/api/v1/vlm",
    tags=["VLM Health"]
)


@router.get("/check", response_model=VLMHealthCheckResponse)
async def check_vlm_health():
    """
    Check VLM health status.

    Performs a health check on the Vision Language Model and returns
    current status, model information, and individual health check results.

    Returns:
        VLMHealthCheckResponse with health status and details
    """
    manager = get_health_manager()
    health_data = manager.check_health()

    return VLMHealthCheckResponse(**health_data)


@router.get("/baseline", response_model=VLMBaselineResponse)
async def get_vlm_baseline():
    """
    Get current VLM health baseline.

    Returns the currently configured baseline metrics used for
    health comparison.

    Returns:
        VLMBaselineResponse with baseline metrics
    """
    manager = get_health_manager()
    baseline = manager.get_baseline()

    return VLMBaselineResponse(
        success=True,
        baseline=baseline,
        message="Baseline retrieved successfully"
    )


@router.post("/baseline", response_model=VLMBaselineResponse)
async def set_vlm_baseline(baseline: Dict[str, Any]):
    """
    Set new VLM health baseline.

    Updates the baseline metrics used for health comparison.

    Args:
        baseline: Dictionary of baseline metrics (accuracy, latency_ms, memory_mb, etc.)

    Returns:
        VLMBaselineResponse confirming the update
    """
    manager = get_health_manager()
    manager.set_baseline(baseline)

    return VLMBaselineResponse(
        success=True,
        baseline=baseline,
        message="Baseline updated successfully"
    )


@router.post("/monitor/start", response_model=VLMMonitorResponse)
async def start_vlm_monitoring():
    """
    Start VLM health monitoring.

    Begins continuous monitoring of VLM health metrics.

    Returns:
        VLMMonitorResponse with monitoring status
    """
    manager = get_health_manager()

    if manager.is_monitoring():
        return VLMMonitorResponse(
            success=True,
            monitoring=True,
            message="Monitoring already active"
        )

    manager.start_monitoring()

    return VLMMonitorResponse(
        success=True,
        monitoring=True,
        message="Monitoring started successfully"
    )


@router.post("/monitor/stop", response_model=VLMMonitorResponse)
async def stop_vlm_monitoring():
    """
    Stop VLM health monitoring.

    Halts continuous monitoring of VLM health metrics.

    Returns:
        VLMMonitorResponse with monitoring status
    """
    manager = get_health_manager()

    if not manager.is_monitoring():
        return VLMMonitorResponse(
            success=True,
            monitoring=False,
            message="Monitoring already stopped"
        )

    manager.stop_monitoring()

    return VLMMonitorResponse(
        success=True,
        monitoring=False,
        message="Monitoring stopped successfully"
    )


@router.get("/monitor/status", response_model=VLMMonitorStatusResponse)
async def get_vlm_monitor_status():
    """
    Get VLM monitoring status.

    Returns current status of health monitoring including
    check count, last check time, and health score.

    Returns:
        VLMMonitorStatusResponse with monitoring details
    """
    manager = get_health_manager()
    status = manager.get_status()

    return VLMMonitorStatusResponse(**status)

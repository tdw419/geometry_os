#!/usr/bin/env python3
"""
Thought Gateway - FastAPI Backend for ChromaDB Thought Logging

Provides REST API for:
- Logging thoughts with spatial coordinates
- Semantic search across AI thoughts
- Time-travel timeline queries
- Error teleportation endpoint

Usage:
    uvicorn thought_gateway:app --host 0.0.0.0 --port 8765
"""

import sys
from pathlib import Path
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional, List

sys.path.insert(0, str(Path(__file__).parent))

from thought_logger import ThoughtLogger, ThoughtWrapper

# =============================================================================
# FASTAPI APP
# =============================================================================

app = FastAPI(
    title="Geometry OS - Thought Gateway",
    description="ChromaDB-powered AI thought logging and spatial search",
    version="1.0.0",
)

# Initialize logger (persistent by default)
logger = ThoughtLogger(persistent=True)
wrapper = ThoughtWrapper(logger)

# =============================================================================
# PYDANTIC MODELS
# =============================================================================


class ThoughtRequest(BaseModel):
    content: str
    x: Optional[int] = 0
    y: Optional[int] = 0
    thought_type: str = "analysis"
    agent_sig: Optional[str] = None
    metadata: Optional[dict] = None


class HexWriteRequest(BaseModel):
    hex_value: str
    x: int
    y: int
    agent_sig: Optional[str] = None


class SecurityEventRequest(BaseModel):
    event: str
    x: Optional[int] = None
    y: Optional[int] = None
    agent_sig: Optional[str] = None
    severity: str = "warning"


class SearchRequest(BaseModel):
    query: str
    n_results: int = 10
    thought_type: Optional[str] = None


class SpatialQueryRequest(BaseModel):
    x: int
    y: int
    radius: int = 10
    limit: int = 20


class TimelineRequest(BaseModel):
    start_time: Optional[str] = None
    end_time: Optional[str] = None
    limit: int = 100


class ThoughtResponse(BaseModel):
    id: str
    content: str
    timestamp: str
    x: int
    y: int
    type: str
    agent_sig: str


class TeleportResponse(BaseModel):
    success: bool
    x: Optional[int] = None
    y: Optional[int] = None
    message: str


# =============================================================================
# ROUTES
# =============================================================================


@app.get("/")
def root():
    """Health check and API info."""
    return {
        "service": "Thought Gateway",
        "status": "running",
        "endpoints": [
            "/thought",  # POST - Log thought
            "/hex-write",  # POST - Log hex write
            "/security-event",  # POST - Log security event
            "/search",  # POST - Semantic search
            "/spatial-query",  # POST - Query by location
            "/timeline",  # POST - Get timeline
            "/teleport-error",  # GET - Teleport to last error
        ],
    }


@app.post("/thought", response_model=ThoughtResponse)
def log_thought(request: ThoughtRequest):
    """
    Log a thought with spatial coordinates.

    The content will be embedded for semantic search.
    """
    thought_id = logger.log_thought(
        content=request.content,
        x=request.x,
        y=request.y,
        thought_type=request.thought_type,
        agent_sig=request.agent_sig,
        metadata=request.metadata,
    )

    # Return the logged thought
    results = logger.search(request.content, n_results=1)
    if results:
        r = results[0]
        return ThoughtResponse(
            id=thought_id,
            content=r["content"],
            timestamp=r["timestamp"],
            x=r["x"],
            y=r["y"],
            type=r["type"],
            agent_sig=r["agent_sig"],
        )

    return ThoughtResponse(
        id=thought_id,
        content=request.content,
        timestamp="",
        x=request.x,
        y=request.y,
        type=request.thought_type,
        agent_sig=request.agent_sig or "system",
    )


@app.post("/hex-write", response_model=ThoughtResponse)
def log_hex_write(request: HexWriteRequest):
    """
    Log a hex write operation.

    Automatically categorizes as 'write' type.
    """
    thought_id = logger.log_hex_write(
        hex_value=request.hex_value, x=request.x, y=request.y, agent_sig=request.agent_sig
    )

    results = logger.search(request.hex_value, n_results=1)
    if results:
        r = results[0]
        return ThoughtResponse(
            id=thought_id,
            content=r["content"],
            timestamp=r["timestamp"],
            x=r["x"],
            y=r["y"],
            type=r["type"],
            agent_sig=r["agent_sig"],
        )

    return ThoughtResponse(
        id=thought_id,
        content=f"Hex write: {request.hex_value} at ({request.x}, {request.y})",
        timestamp="",
        x=request.x,
        y=request.y,
        type="write",
        agent_sig=request.agent_sig or "system",
    )


@app.post("/security-event", response_model=ThoughtResponse)
def log_security_event(request: SecurityEventRequest):
    """
    Log a security validation event.

    Severity levels: info, warning, critical
    """
    thought_id = logger.log_security_event(
        event=request.event,
        x=request.x,
        y=request.y,
        agent_sig=request.agent_sig,
        severity=request.severity,
    )

    results = logger.search(request.event, n_results=1)
    if results:
        r = results[0]
        return ThoughtResponse(
            id=thought_id,
            content=r["content"],
            timestamp=r["timestamp"],
            x=r["x"],
            y=r["y"],
            type=r["type"],
            agent_sig=r["agent_sig"],
        )

    return ThoughtResponse(
        id=thought_id,
        content=f"Security {request.severity}: {request.event}",
        timestamp="",
        x=request.x or 0,
        y=request.y or 0,
        type="security",
        agent_sig=request.agent_sig or "system",
    )


@app.post("/search")
def semantic_search(request: SearchRequest):
    """
    Semantic search across all logged thoughts.

    Returns matching thoughts with coordinates for camera teleportation.
    """
    results = logger.search(
        query=request.query, n_results=request.n_results, thought_type=request.thought_type
    )

    return {"query": request.query, "results_count": len(results), "results": results}


@app.post("/spatial-query")
def query_by_location(request: SpatialQueryRequest):
    """
    Get all thoughts within a spatial radius.

    Useful for showing context when user navigates to a location.
    """
    results = logger.get_thoughts_at_location(
        x=request.x, y=request.y, radius=request.radius, limit=request.limit
    )

    return {
        "center": {"x": request.x, "y": request.y},
        "radius": request.radius,
        "results_count": len(results),
        "results": results,
    }


@app.post("/timeline")
def get_timeline(request: TimelineRequest):
    """
    Get thoughts within a time range.

    Used for the time-travel UI slider.
    """
    results = logger.get_timeline(
        start_time=request.start_time, end_time=request.end_time, limit=request.limit
    )

    return {
        "time_range": {"start": request.start_time, "end": request.end_time},
        "results_count": len(results),
        "results": results,
    }


@app.get("/teleport-error", response_model=TeleportResponse)
def teleport_to_last_error():
    """
    Find the most recent error and return its coordinates.

    Frontend can use this to automatically pan camera to where AI last errored.
    """
    coords = logger.teleport_to_error()

    if coords:
        return TeleportResponse(
            success=True,
            x=coords["x"],
            y=coords["y"],
            message=f"Found error at ({coords['x']}, {coords['y']})",
        )
    else:
        return TeleportResponse(success=False, message="No recent errors found")


@app.get("/stats")
def get_stats():
    """
    Get thought logging statistics.
    """
    # Get total count from timeline (approximate)
    all_thoughts = logger.get_timeline(limit=1)

    return {
        "logger_active": True,
        "chroma_available": hasattr(logger, "collection"),
        "note": "Full stats require ChromaDB collection.count()",
    }


# =============================================================================
# MAIN
# =============================================================================

if __name__ == "__main__":
    import uvicorn

    print("=" * 60)
    print("THOUGHT GATEWAY - CHROMADB API")
    print("=" * 60)
    print("\nStarting server...")

    uvicorn.run(app, host="0.0.0.0", port=8765, reload=False)

#!/usr/bin/env python3
"""
Catalog Server
FastAPI application providing REST endpoints for visual catalog operations.

Provides:
- GET /api/v1/catalog - List all entries with thumbnails
- POST /api/v1/catalog/{entry_id}/boot - Boot an entry
- POST /api/v1/catalog/layout - Update layout after drag
- GET /api/v1/catalog/refresh - Rescan filesystem
- GET / - Serve HTML gallery UI
"""

import logging
import threading
import sys
from pathlib import Path
from typing import List, Optional, Dict, Any

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, JSONResponse
from pydantic import BaseModel

# Handle both package and direct script imports
try:
    from .catalog_scanner import CatalogScanner, CatalogEntry
    from .thumbnail_cache import ThumbnailCache
    from .spatial_layout import SpatialLayoutManager, SpatialPosition
except ImportError:
    # When run directly as a script
    from catalog_scanner import CatalogScanner, CatalogEntry
    from thumbnail_cache import ThumbnailCache
    from spatial_layout import SpatialLayoutManager, SpatialPosition


logger = logging.getLogger(__name__)


# Pydantic models for API

class BootOptions(BaseModel):
    """Options for booting a catalog entry."""
    memory: str = "2G"
    cpus: int = 2
    cmdline: Optional[str] = None


class LayoutUpdate(BaseModel):
    """Request to update layout position."""
    entry_id: str
    new_position: dict  # {"x": int, "y": int}


class CatalogEntryResponse(BaseModel):
    """Response model for a single catalog entry."""
    id: str
    name: str
    path: str
    size: int
    kernel_version: Optional[str]
    distro: Optional[str]
    architecture: Optional[str]
    thumbnail: str  # base64
    position: dict  # {"x": int, "y": int}


class CatalogResponse(BaseModel):
    """Response model for full catalog."""
    entries: List[CatalogEntryResponse]
    grid_dimensions: dict  # {"width": int, "height": int}


class BootResponse(BaseModel):
    """Response model for boot operation."""
    success: bool
    entry_id: str
    entry_name: str
    vnc_port: Optional[int]
    pid: Optional[int]
    error_message: Optional[str]


class RefreshResponse(BaseModel):
    """Response model for refresh operation."""
    success: bool
    entries_count: int
    message: str


class ErrorResponse(BaseModel):
    """Error response model."""
    success: bool = False
    error: str
    detail: Optional[str] = None


# Create FastAPI app
app = FastAPI(
    title="PixelRTS Catalog",
    description="Visual catalog for OS containers",
    version="1.0.0",
    docs_url="/docs"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


class CatalogServer:
    """
    FastAPI-based catalog server for visual management of .rts.png files.

    Provides REST endpoints for:
    - Listing catalog entries with thumbnails
    - Booting entries via BootBridge
    - Updating spatial layout

    Usage:
        server = CatalogServer(watch_paths=["/path/to/images"])
        entries = server.get_entries()
        result = server.boot_entry("abc123", BootOptions(memory="4G"))
    """

    def __init__(self, watch_paths: Optional[List[str]] = None):
        """
        Initialize catalog server.

        Args:
            watch_paths: Directories to scan for .rts.png files
        """
        self.scanner = CatalogScanner(watch_paths)
        self.thumbnail_cache = ThumbnailCache()
        self.layout_manager = SpatialLayoutManager()

        # Cache of entries (refreshed on scan)
        self._entries: List[CatalogEntry] = []

        # Track active boot operations
        self._active_boots: Dict[str, Any] = {}

        # Initial scan
        self._refresh_entries()

    def _refresh_entries(self) -> int:
        """
        Refresh catalog entries from filesystem.

        Returns:
            Number of entries discovered
        """
        self._entries = self.scanner.scan()
        logger.info(f"Refreshed catalog: {len(self._entries)} entries")
        return len(self._entries)

    def _assign_positions(self) -> None:
        """
        Assign grid positions to entries without positions.
        Uses first-available slot approach.
        """
        positions = self.layout_manager.get_all_positions()

        # Find occupied positions
        occupied = {(pos.x, pos.y) for pos in positions.values()}

        # Assign positions to new entries
        next_x, next_y = 0, 0
        for entry in self._entries:
            if entry.id not in positions:
                # Find next available slot
                while (next_x, next_y) in occupied:
                    next_x += 1
                    if next_x >= 10:  # Max columns
                        next_x = 0
                        next_y += 1

                # Assign position
                self.layout_manager.set_position(
                    entry.id,
                    SpatialPosition(x=next_x, y=next_y)
                )
                occupied.add((next_x, next_y))
                next_x += 1

    def get_entries(self) -> List[CatalogEntryResponse]:
        """
        Get all catalog entries with thumbnails and positions.

        Returns:
            List of CatalogEntryResponse objects
        """
        responses = []

        for entry in self._entries:
            # Get thumbnail as base64
            try:
                thumbnail_b64 = self.thumbnail_cache.get_thumbnail_base64(entry.path)
            except Exception as e:
                logger.warning(f"Failed to generate thumbnail for {entry.path}: {e}")
                thumbnail_b64 = ""  # Empty thumbnail on error

            # Get position from layout manager
            position = self.layout_manager.get_position(entry.id)
            if position is None:
                position = SpatialPosition(x=0, y=0)

            responses.append(CatalogEntryResponse(
                id=entry.id,
                name=entry.name,
                path=entry.path,
                size=entry.size,
                kernel_version=entry.kernel_version,
                distro=entry.distro,
                architecture=entry.architecture,
                thumbnail=thumbnail_b64,
                position=position.to_dict()
            ))

        return responses

    def boot_entry(self, entry_id: str, options: BootOptions) -> Dict[str, Any]:
        """
        Boot a catalog entry using BootBridge.

        Runs boot in background thread to avoid blocking API.

        Args:
            entry_id: ID of entry to boot
            options: Boot options (memory, cpus, cmdline)

        Returns:
            Dictionary with boot result

        Raises:
            ValueError: If entry_id not found
        """
        # Find entry
        entry = None
        for e in self._entries:
            if e.id == entry_id:
                entry = e
                break

        if entry is None:
            raise ValueError(f"Entry not found: {entry_id}")

        # Import BootBridge
        try:
            from systems.pixel_compiler.boot import BootBridge, BootResult
        except ImportError:
            try:
                from pixel_compiler.boot import BootBridge, BootResult
            except ImportError:
                raise ImportError(
                    "BootBridge not available. Ensure systems.pixel_compiler.boot is importable."
                )

        # Create boot bridge
        bridge = BootBridge(
            rts_png_path=entry.path,
            memory=options.memory,
            cpus=options.cpus,
            verbose=False
        )

        # Store bridge for cleanup tracking
        self._active_boots[entry_id] = bridge

        # Run boot in thread
        result_holder = {"result": None, "error": None}

        def run_boot():
            try:
                result = bridge.boot(cmdline=options.cmdline)
                result_holder["result"] = result
            except Exception as e:
                result_holder["error"] = str(e)
                logger.error(f"Boot failed for {entry.name}: {e}")

        thread = threading.Thread(target=run_boot, daemon=True)
        thread.start()
        thread.join(timeout=30)  # Wait up to 30 seconds for boot

        # Check result
        if result_holder["error"]:
            return {
                "success": False,
                "entry_id": entry_id,
                "entry_name": entry.name,
                "vnc_port": None,
                "pid": None,
                "error_message": result_holder["error"]
            }

        result = result_holder["result"]
        if result and result.success:
            return {
                "success": True,
                "entry_id": entry_id,
                "entry_name": entry.name,
                "vnc_port": result.vnc_port,
                "pid": result.pid,
                "error_message": None
            }
        else:
            return {
                "success": False,
                "entry_id": entry_id,
                "entry_name": entry.name,
                "vnc_port": None,
                "pid": None,
                "error_message": result.error_message if result else "Boot failed"
            }


# Singleton instance
_catalog_server: Optional[CatalogServer] = None


def get_catalog_server(watch_paths: Optional[List[str]] = None) -> CatalogServer:
    """
    Get or create the singleton CatalogServer instance.

    Args:
        watch_paths: Directories to scan (only used on first call)

    Returns:
        CatalogServer instance
    """
    global _catalog_server
    if _catalog_server is None:
        _catalog_server = CatalogServer(watch_paths)
    return _catalog_server


# API Routes

@app.get("/", response_class=HTMLResponse, tags=["UI"])
async def serve_catalog_html():
    """
    Serve the catalog HTML gallery UI.

    Returns:
        HTML page with visual catalog interface
    """
    template_path = Path(__file__).parent / "templates" / "catalog.html"

    if not template_path.exists():
        raise HTTPException(
            status_code=500,
            detail="Catalog template not found"
        )

    return HTMLResponse(content=template_path.read_text())


@app.get("/api/v1/catalog", response_model=CatalogResponse, tags=["Catalog"])
async def list_catalog():
    """
    List all catalog entries with thumbnails.

    Returns:
        CatalogResponse with all entries and grid dimensions
    """
    server = get_catalog_server()

    # Ensure positions assigned
    server._assign_positions()

    entries = server.get_entries()
    grid_width, grid_height = server.layout_manager.get_grid_dimensions()

    return CatalogResponse(
        entries=entries,
        grid_dimensions={"width": grid_width, "height": grid_height}
    )


@app.post("/api/v1/catalog/{entry_id}/boot", response_model=BootResponse, tags=["Catalog"])
async def boot_catalog_entry(entry_id: str, options: BootOptions = BootOptions()):
    """
    Boot a catalog entry.

    Uses BootBridge to mount FUSE and start QEMU.

    Args:
        entry_id: ID of entry to boot
        options: Boot options (memory, cpus, cmdline)

    Returns:
        BootResponse with success status and access details
    """
    server = get_catalog_server()

    try:
        result = server.boot_entry(entry_id, options)
        return BootResponse(**result)
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except ImportError as e:
        raise HTTPException(status_code=500, detail=str(e))
    except Exception as e:
        logger.error(f"Boot error: {e}")
        raise HTTPException(status_code=500, detail=f"Boot failed: {e}")


@app.post("/api/v1/catalog/layout", tags=["Catalog"])
async def update_layout(update: LayoutUpdate):
    """
    Update layout position after drag-and-drop.

    Implements swap semantics: if target position is occupied,
    the two entries swap positions.

    Args:
        update: LayoutUpdate with entry_id and new_position

    Returns:
        Success response
    """
    server = get_catalog_server()

    # Parse position
    try:
        x = update.new_position.get("x", 0)
        y = update.new_position.get("y", 0)
        new_position = SpatialPosition(x=x, y=y)
    except (KeyError, TypeError) as e:
        raise HTTPException(
            status_code=400,
            detail=f"Invalid position format: {e}"
        )

    # Move entry
    success = server.layout_manager.move_entry(update.entry_id, new_position)

    if not success:
        raise HTTPException(
            status_code=404,
            detail=f"Entry not found: {update.entry_id}"
        )

    return {"success": True, "entry_id": update.entry_id, "position": update.new_position}


@app.get("/api/v1/catalog/refresh", response_model=RefreshResponse, tags=["Catalog"])
async def refresh_catalog():
    """
    Rescan filesystem for new .rts.png files.

    Returns:
        RefreshResponse with count of discovered entries
    """
    server = get_catalog_server()

    count = server._refresh_entries()
    server._assign_positions()

    return RefreshResponse(
        success=True,
        entries_count=count,
        message=f"Discovered {count} .rts.png files"
    )


@app.exception_handler(HTTPException)
async def http_exception_handler(request, exc):
    """Custom exception handler for HTTP exceptions."""
    return JSONResponse(
        status_code=exc.status_code,
        content={"success": False, "error": exc.detail, "status_code": exc.status_code}
    )


@app.exception_handler(Exception)
async def general_exception_handler(request, exc):
    """Custom exception handler for general exceptions."""
    logger.error(f"Unhandled exception: {exc}")
    return JSONResponse(
        status_code=500,
        content={"success": False, "error": f"Internal server error: {str(exc)}", "status_code": 500}
    )


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)

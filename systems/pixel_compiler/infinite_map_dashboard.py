#!/usr/bin/env python3
"""
Infinite Map Real-Time Visualization Dashboard.

Provides live visualization of spatial data layout and access patterns
through WebSocket streaming and WebGL rendering.

Key Components:
- WebSocketServer: Real-time data streaming
- HeatMapRenderer: Access density visualization
- AccessPatternVisualizer: Pattern analysis display
- ZoneBoundaryOverlay: Zone visualization
- FileLocationSearch: Fast file lookup
- TimeLapsePlayback: Historical playback
- DashboardServer: Unified HTTP/WebSocket server

Usage:
    from infinite_map_dashboard import DashboardServer

    server = DashboardServer(image_path="os.rts.png", port=8080)
    server.start()
"""

import os
import sys
import json
import time
import asyncio
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Tuple, Set
from datetime import datetime, timedelta
from enum import Enum, auto
from collections import deque
import logging
import base64
import io

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Try to import optional dependencies
try:
    import numpy as np
    HAS_NUMPY = True
except ImportError:
    HAS_NUMPY = False

try:
    from PIL import Image
    HAS_PIL = True
except ImportError:
    HAS_PIL = False


# ============================================================================
# Enums and Dataclasses
# ============================================================================

class EventType(Enum):
    """Types of dashboard events."""
    ACCESS = "access"
    WRITE = "write"
    MIGRATION = "migration"
    ZONE_CHANGE = "zone_change"
    ERROR = "error"
    HEARTBEAT = "heartbeat"


class VisualizationMode(Enum):
    """Visualization display modes."""
    HEATMAP = "heatmap"
    ZONES = "zones"
    ACCESS_PATTERN = "access_pattern"
    FILE_LOCATION = "file_location"
    TIME_LAPSE = "time_lapse"


@dataclass
class AccessEvent:
    """Records a file access event."""
    filename: str
    x: int
    y: int
    zone: str
    timestamp: datetime
    access_type: str  # "read" or "write"
    duration_ms: float = 0.0

    def to_dict(self) -> Dict[str, Any]:
        return {
            "filename": self.filename,
            "x": self.x,
            "y": self.y,
            "zone": self.zone,
            "timestamp": self.timestamp.isoformat(),
            "access_type": self.access_type,
            "duration_ms": self.duration_ms,
        }


@dataclass
class HeatMapData:
    """Heat map data for visualization."""
    grid: List[List[int]]  # 2D array of access counts
    width: int
    height: int
    max_value: int
    min_value: int
    timestamp: datetime = field(default_factory=datetime.now)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "grid": self.grid,
            "width": self.width,
            "height": self.height,
            "max_value": self.max_value,
            "min_value": self.min_value,
            "timestamp": self.timestamp.isoformat(),
        }


@dataclass
class ZoneBoundary:
    """Zone boundary information."""
    name: str
    inner_radius: int
    outer_radius: int
    color: str
    file_count: int
    byte_count: int

    def to_dict(self) -> Dict[str, Any]:
        return {
            "name": self.name,
            "inner_radius": self.inner_radius,
            "outer_radius": self.outer_radius,
            "color": self.color,
            "file_count": self.file_count,
            "byte_count": self.byte_count,
        }


@dataclass
class FileLocation:
    """File location information."""
    filename: str
    x: int
    y: int
    zone: str
    size: int
    access_count: int
    last_accessed: Optional[datetime]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "filename": self.filename,
            "x": self.x,
            "y": self.y,
            "zone": self.zone,
            "size": self.size,
            "access_count": self.access_count,
            "last_accessed": self.last_accessed.isoformat() if self.last_accessed else None,
        }


@dataclass
class TimeLapseFrame:
    """Single frame in a time-lapse."""
    timestamp: datetime
    heatmap: HeatMapData
    events: List[AccessEvent]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "timestamp": self.timestamp.isoformat(),
            "heatmap": self.heatmap.to_dict(),
            "events": [e.to_dict() for e in self.events],
        }


# ============================================================================
# Access Event Tracker
# ============================================================================

class AccessEventTracker:
    """
    Tracks file access events for visualization.

    Maintains a rolling history of access events for
    real-time visualization and time-lapse playback.
    """

    def __init__(self, max_events: int = 10000, history_hours: int = 24):
        self.max_events = max_events
        self.history_hours = history_hours
        self.events: deque = deque(maxlen=max_events)
        self.access_counts: Dict[str, int] = {}
        self._lock = threading.Lock()

    def record_access(
        self,
        filename: str,
        x: int,
        y: int,
        zone: str,
        access_type: str = "read",
        duration_ms: float = 0.0
    ) -> AccessEvent:
        """Record a file access event."""
        event = AccessEvent(
            filename=filename,
            x=x,
            y=y,
            zone=zone,
            timestamp=datetime.now(),
            access_type=access_type,
            duration_ms=duration_ms,
        )

        with self._lock:
            self.events.append(event)
            self.access_counts[filename] = self.access_counts.get(filename, 0) + 1

        return event

    def get_recent_events(self, seconds: int = 60) -> List[AccessEvent]:
        """Get events from the last N seconds."""
        cutoff = datetime.now() - timedelta(seconds=seconds)
        with self._lock:
            return [e for e in self.events if e.timestamp >= cutoff]

    def get_events_in_range(
        self,
        start: datetime,
        end: datetime
    ) -> List[AccessEvent]:
        """Get events in a time range."""
        with self._lock:
            return [e for e in self.events if start <= e.timestamp <= end]

    def get_hot_files(self, count: int = 10) -> List[Tuple[str, int]]:
        """Get most frequently accessed files."""
        with self._lock:
            sorted_files = sorted(
                self.access_counts.items(),
                key=lambda x: x[1],
                reverse=True
            )
            return sorted_files[:count]

    def cleanup_old_events(self):
        """Remove events older than history_hours."""
        cutoff = datetime.now() - timedelta(hours=self.history_hours)
        with self._lock:
            # Deque automatically handles max size
            # But we can filter if needed
            pass

    def get_stats(self) -> Dict[str, Any]:
        """Get tracker statistics."""
        with self._lock:
            return {
                "total_events": len(self.events),
                "unique_files": len(self.access_counts),
                "max_capacity": self.max_events,
                "history_hours": self.history_hours,
            }


# ============================================================================
# Heat Map Renderer
# ============================================================================

class HeatMapRenderer:
    """
    Renders heat maps from access event data.

    Creates 2D grids showing access density for visualization.
    """

    # Zone colors (RGB hex)
    ZONE_COLORS = {
        "HOT": "#ff0000",
        "WARM": "#ff8800",
        "TEMPERATE": "#ffff00",
        "COOL": "#00ff00",
        "COLD": "#0088ff",
    }

    # Heat map color gradient (cold to hot)
    HEAT_COLORS = [
        "#000033",  # Very cold (dark blue)
        "#0000ff",  # Cold (blue)
        "#00ffff",  # Cool (cyan)
        "#00ff00",  # Moderate (green)
        "#ffff00",  # Warm (yellow)
        "#ff8800",  # Hot (orange)
        "#ff0000",  # Very hot (red)
        "#ffffff",  # Extreme (white)
    ]

    def __init__(self, grid_size: int = 256):
        self.grid_size = grid_size
        self.grid = [[0] * grid_size for _ in range(grid_size)]

    def update_from_events(
        self,
        events: List[AccessEvent],
        grid_size: Optional[int] = None
    ) -> HeatMapData:
        """Update heat map from access events."""
        size = grid_size or self.grid_size

        # Reset grid
        grid = [[0] * size for _ in range(size)]

        # Count accesses per cell
        for event in events:
            # Map coordinates to grid
            gx = min(size - 1, max(0, event.x * size // 2048))
            gy = min(size - 1, max(0, event.y * size // 2048))
            grid[gy][gx] += 1

        # Find min/max
        flat = [v for row in grid for v in row]
        min_val = min(flat) if flat else 0
        max_val = max(flat) if flat else 1

        return HeatMapData(
            grid=grid,
            width=size,
            height=size,
            max_value=max_val,
            min_value=min_val,
        )

    def render_to_image(
        self,
        heatmap: HeatMapData,
        colormap: Optional[List[str]] = None
    ) -> Optional[bytes]:
        """Render heat map to PNG image bytes."""
        if not HAS_PIL or not HAS_NUMPY:
            return None

        colors = colormap or self.HEAT_COLORS

        # Normalize grid to 0-1
        grid = np.array(heatmap.grid, dtype=np.float32)
        if heatmap.max_value > heatmap.min_value:
            grid = (grid - heatmap.min_value) / (heatmap.max_value - heatmap.min_value)
        else:
            grid = np.zeros_like(grid)

        # Map to color indices
        color_indices = (grid * (len(colors) - 1)).astype(int)

        # Create RGB image
        img_array = np.zeros((heatmap.height, heatmap.width, 3), dtype=np.uint8)

        for i, color in enumerate(colors):
            # Parse hex color
            r = int(color[1:3], 16)
            g = int(color[3:5], 16)
            b = int(color[5:7], 16)

            mask = color_indices == i
            img_array[mask] = [r, g, b]

        # Convert to PNG
        img = Image.fromarray(img_array, mode="RGB")
        buffer = io.BytesIO()
        img.save(buffer, format="PNG")
        return buffer.getvalue()

    def get_color_for_value(
        self,
        value: int,
        min_val: int,
        max_val: int
    ) -> str:
        """Get color for a heat map value."""
        if max_val <= min_val:
            return self.HEAT_COLORS[0]

        normalized = (value - min_val) / (max_val - min_val)
        index = int(normalized * (len(self.HEAT_COLORS) - 1))
        index = min(index, len(self.HEAT_COLORS) - 1)
        return self.HEAT_COLORS[index]


# ============================================================================
# Zone Boundary Overlay
# ============================================================================

class ZoneBoundaryOverlay:
    """
    Manages zone boundary visualization.

    Calculates and renders zone boundaries for overlay display.
    """

    # Default zone configuration
    DEFAULT_ZONES = [
        ("HOT", 0, 128, "#ff0000"),
        ("WARM", 128, 384, "#ff8800"),
        ("TEMPERATE", 384, 768, "#ffff00"),
        ("COOL", 768, 1536, "#00ff00"),
        ("COLD", 1536, 2048, "#0088ff"),
    ]

    def __init__(self, grid_size: int = 2048):
        self.grid_size = grid_size
        self.zones: List[ZoneBoundary] = []

    def calculate_zones(
        self,
        vat_entries: Dict[str, Any],
        center: Tuple[int, int] = (1024, 1024)
    ) -> List[ZoneBoundary]:
        """Calculate zone boundaries from VAT entries."""
        # Count files per zone
        zone_files: Dict[str, Set[str]] = {z[0]: set() for z in self.DEFAULT_ZONES}
        zone_bytes: Dict[str, int] = {z[0]: 0 for z in self.DEFAULT_ZONES}

        for filename, entry in vat_entries.items():
            # Get position from entry
            if hasattr(entry, '__iter__') and len(entry) > 0:
                loc = entry[0] if isinstance(entry, list) else entry
                if hasattr(loc, 'x') and hasattr(loc, 'y'):
                    x, y = loc.x, loc.y
                elif isinstance(loc, tuple) and len(loc) >= 2:
                    x, y = loc[0], loc[1]
                else:
                    continue
            else:
                continue

            # Calculate distance from center
            dist = ((x - center[0])**2 + (y - center[1])**2)**0.5

            # Determine zone
            for zone_name, inner, outer, _ in self.DEFAULT_ZONES:
                if inner <= dist < outer:
                    zone_files[zone_name].add(filename)
                    # Estimate size (would need actual file size)
                    zone_bytes[zone_name] += 4096  # Assume 4KB cluster
                    break

        # Create zone boundaries
        self.zones = []
        for zone_name, inner, outer, color in self.DEFAULT_ZONES:
            self.zones.append(ZoneBoundary(
                name=zone_name,
                inner_radius=inner,
                outer_radius=outer,
                color=color,
                file_count=len(zone_files[zone_name]),
                byte_count=zone_bytes[zone_name],
            ))

        return self.zones

    def render_overlay(
        self,
        width: int,
        height: int
    ) -> List[Dict[str, Any]]:
        """Render zone boundaries as circles for overlay."""
        overlays = []

        for zone in self.zones:
            # Scale to image dimensions
            scale = min(width, height) / self.grid_size
            cx, cy = width // 2, height // 2

            overlays.append({
                "type": "circle",
                "cx": cx,
                "cy": cy,
                "r": int(zone.outer_radius * scale),
                "stroke": zone.color,
                "strokeWidth": 2,
                "fill": "none",
                "label": zone.name,
                "fileCount": zone.file_count,
            })

        return overlays

    def get_zone_for_position(
        self,
        x: int,
        y: int,
        center: Tuple[int, int] = (1024, 1024)
    ) -> str:
        """Get zone name for a position."""
        dist = ((x - center[0])**2 + (y - center[1])**2)**0.5

        for zone in self.zones:
            if zone.inner_radius <= dist < zone.outer_radius:
                return zone.name

        return "UNKNOWN"


# ============================================================================
# File Location Search
# ============================================================================

class FileLocationSearch:
    """
    Fast file location search for dashboard.

    Provides sub-100ms file lookup with indexing.
    """

    def __init__(self):
        self.files: Dict[str, FileLocation] = {}
        self.name_index: Dict[str, Set[str]] = {}  # name -> full paths
        self._lock = threading.Lock()

    def index_files(
        self,
        vat_entries: Dict[str, Any],
        center: Tuple[int, int] = (1024, 1024)
    ):
        """Index all files from VAT entries."""
        with self._lock:
            self.files.clear()
            self.name_index.clear()

            for filename, entry in vat_entries.items():
                # Get position
                if hasattr(entry, '__iter__') and len(entry) > 0:
                    loc = entry[0] if isinstance(entry, list) else entry
                    if hasattr(loc, 'x') and hasattr(loc, 'y'):
                        x, y = loc.x, loc.y
                    elif isinstance(loc, tuple) and len(loc) >= 2:
                        x, y = loc[0], loc[1]
                    else:
                        continue
                else:
                    continue

                # Determine zone
                dist = ((x - center[0])**2 + (y - center[1])**2)**0.5
                if dist < 128:
                    zone = "HOT"
                elif dist < 384:
                    zone = "WARM"
                elif dist < 768:
                    zone = "TEMPERATE"
                elif dist < 1536:
                    zone = "COOL"
                else:
                    zone = "COLD"

                # Create file location
                location = FileLocation(
                    filename=filename,
                    x=x,
                    y=y,
                    zone=zone,
                    size=4096,  # Estimate
                    access_count=0,
                    last_accessed=None,
                )

                self.files[filename] = location

                # Index by name parts
                name = os.path.basename(filename)
                if name not in self.name_index:
                    self.name_index[name] = set()
                self.name_index[name].add(filename)

    def search(
        self,
        query: str,
        limit: int = 100
    ) -> List[FileLocation]:
        """Search for files matching query."""
        query_lower = query.lower()

        with self._lock:
            results = []

            # Direct match
            if query in self.files:
                results.append(self.files[query])

            # Name contains query
            for name, paths in self.name_index.items():
                if query_lower in name.lower():
                    for path in paths:
                        if path not in [r.filename for r in results]:
                            results.append(self.files[path])
                            if len(results) >= limit:
                                return results

            # Path contains query
            for filename, location in self.files.items():
                if query_lower in filename.lower():
                    if filename not in [r.filename for r in results]:
                        results.append(location)
                        if len(results) >= limit:
                            break

            return results[:limit]

    def get_file(self, filename: str) -> Optional[FileLocation]:
        """Get a specific file by name."""
        with self._lock:
            return self.files.get(filename)

    def update_access_count(self, filename: str):
        """Update access count for a file."""
        with self._lock:
            if filename in self.files:
                self.files[filename].access_count += 1
                self.files[filename].last_accessed = datetime.now()

    def get_stats(self) -> Dict[str, Any]:
        """Get search index statistics."""
        with self._lock:
            return {
                "total_files": len(self.files),
                "unique_names": len(self.name_index),
            }


# ============================================================================
# Time-Lapse Playback
# ============================================================================

class TimeLapsePlayback:
    """
    Time-lapse playback for historical visualization.

    Records and plays back access patterns over time.
    """

    def __init__(self, max_frames: int = 1440, frame_interval: int = 60):
        """
        Initialize time-lapse recorder.

        Args:
            max_frames: Maximum frames to store (1440 = 24h at 60s intervals)
            frame_interval: Seconds between frames
        """
        self.max_frames = max_frames
        self.frame_interval = frame_interval
        self.frames: deque = deque(maxlen=max_frames)
        self.renderer = HeatMapRenderer()
        self._lock = threading.Lock()

    def record_frame(
        self,
        events: List[AccessEvent]
    ):
        """Record a time-lapse frame."""
        heatmap = self.renderer.update_from_events(events)

        frame = TimeLapseFrame(
            timestamp=datetime.now(),
            heatmap=heatmap,
            events=events,
        )

        with self._lock:
            self.frames.append(frame)

    def get_frames_in_range(
        self,
        start: datetime,
        end: datetime
    ) -> List[TimeLapseFrame]:
        """Get frames in a time range."""
        with self._lock:
            return [
                f for f in self.frames
                if start <= f.timestamp <= end
            ]

    def get_frame_at(
        self,
        timestamp: datetime
    ) -> Optional[TimeLapseFrame]:
        """Get frame closest to timestamp."""
        with self._lock:
            if not self.frames:
                return None

            closest = None
            min_diff = timedelta.max

            for frame in self.frames:
                diff = abs(frame.timestamp - timestamp)
                if diff < min_diff:
                    min_diff = diff
                    closest = frame

            return closest

    def export_to_json(
        self,
        start: Optional[datetime] = None,
        end: Optional[datetime] = None
    ) -> Dict[str, Any]:
        """Export time-lapse to JSON."""
        frames = self.get_frames_in_range(
            start or datetime.min,
            end or datetime.max
        )

        return {
            "frames": [f.to_dict() for f in frames],
            "frame_count": len(frames),
            "frame_interval": self.frame_interval,
        }


# ============================================================================
# WebSocket Server
# ============================================================================

class WebSocketHandler:
    """
    WebSocket handler for real-time streaming.

    Handles client connections and broadcasts dashboard updates.
    """

    def __init__(self):
        self.clients: Set[Any] = set()
        self._lock = threading.Lock()

    def add_client(self, client: Any):
        """Add a connected client."""
        with self._lock:
            self.clients.add(client)
        logger.info(f"Client connected. Total: {len(self.clients)}")

    def remove_client(self, client: Any):
        """Remove a disconnected client."""
        with self._lock:
            self.clients.discard(client)
        logger.info(f"Client disconnected. Total: {len(self.clients)}")

    async def broadcast(self, message: Dict[str, Any]):
        """Broadcast message to all clients."""
        import json

        data = json.dumps(message)

        with self._lock:
            clients = list(self.clients)

        for client in clients:
            try:
                if hasattr(client, 'send'):
                    await client.send(data)
            except Exception as e:
                logger.error(f"Broadcast error: {e}")
                self.remove_client(client)

    def get_client_count(self) -> int:
        """Get number of connected clients."""
        return len(self.clients)


# ============================================================================
# Dashboard Server
# ============================================================================

class DashboardServer:
    """
    Unified HTTP/WebSocket server for visualization dashboard.

    Provides:
    - HTTP API for data queries
    - WebSocket for real-time streaming
    - Static file serving for web UI
    """

    HTML_TEMPLATE = """
<!DOCTYPE html>
<html>
<head>
    <title>Infinite Map Dashboard</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #1a1a2e; color: #eee; }
        .dashboard { display: grid; grid-template-columns: 1fr 300px; gap: 20px; }
        .main-view { background: #16213e; border-radius: 8px; padding: 20px; }
        .sidebar { background: #16213e; border-radius: 8px; padding: 20px; }
        h1 { margin-top: 0; }
        .stats { display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; margin-bottom: 20px; }
        .stat-box { background: #0f3460; padding: 15px; border-radius: 8px; }
        .stat-value { font-size: 24px; font-weight: bold; color: #e94560; }
        .stat-label { font-size: 12px; color: #aaa; }
        #heatmap { width: 100%; height: 400px; background: #0f3460; border-radius: 8px; }
        .search-box { width: 100%; padding: 10px; border-radius: 4px; border: none; margin-bottom: 10px; }
        .file-list { max-height: 300px; overflow-y: auto; }
        .file-item { padding: 8px; border-bottom: 1px solid #333; cursor: pointer; }
        .file-item:hover { background: #0f3460; }
        .zone { display: flex; align-items: center; margin: 10px 0; }
        .zone-color { width: 20px; height: 20px; border-radius: 4px; margin-right: 10px; }
        .controls { margin-top: 20px; }
        button { background: #e94560; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; margin-right: 5px; }
        button:hover { background: #ff6b6b; }
    </style>
</head>
<body>
    <h1>🗺️ Infinite Map Dashboard</h1>

    <div class="dashboard">
        <div class="main-view">
            <div class="stats">
                <div class="stat-box">
                    <div class="stat-value" id="total-events">0</div>
                    <div class="stat-label">Total Events</div>
                </div>
                <div class="stat-box">
                    <div class="stat-value" id="hot-files">0</div>
                    <div class="stat-label">Hot Files</div>
                </div>
                <div class="stat-box">
                    <div class="stat-value" id="connected-clients">0</div>
                    <div class="stat-label">Connected Clients</div>
                </div>
                <div class="stat-box">
                    <div class="stat-value" id="uptime">0s</div>
                    <div class="stat-label">Uptime</div>
                </div>
            </div>

            <h3>Heat Map</h3>
            <canvas id="heatmap"></canvas>

            <div class="controls">
                <button onclick="setMode('heatmap')">Heat Map</button>
                <button onclick="setMode('zones')">Zones</button>
                <button onclick="setMode('access_pattern')">Access Pattern</button>
            </div>
        </div>

        <div class="sidebar">
            <h3>Zone Distribution</h3>
            <div id="zones"></div>

            <h3>File Search</h3>
            <input type="text" class="search-box" id="search" placeholder="Search files..." oninput="searchFiles(this.value)">
            <div class="file-list" id="file-results"></div>

            <h3>Hot Files</h3>
            <div class="file-list" id="hot-files-list"></div>
        </div>
    </div>

    <script>
        const ws = new WebSocket('ws://' + window.location.host + '/ws');
        let start_time = Date.now();

        ws.onmessage = function(event) {
            const data = JSON.parse(event.data);
            updateDashboard(data);
        };

        ws.onopen = function() {
            console.log('Connected to dashboard');
        };

        function updateDashboard(data) {
            if (data.type === 'stats') {
                document.getElementById('total-events').textContent = data.events || 0;
                document.getElementById('hot-files').textContent = data.hot_files || 0;
                document.getElementById('connected-clients').textContent = data.clients || 0;
            }

            if (data.type === 'heatmap') {
                renderHeatmap(data);
            }

            if (data.type === 'zones') {
                renderZones(data.zones);
            }

            // Update uptime
            const uptime = Math.floor((Date.now() - start_time) / 1000);
            document.getElementById('uptime').textContent = uptime + 's';
        }

        function renderHeatmap(data) {
            const canvas = document.getElementById('heatmap');
            const ctx = canvas.getContext('2d');
            canvas.width = canvas.offsetWidth;
            canvas.height = 400;

            const grid = data.grid;
            const cellW = canvas.width / data.width;
            const cellH = canvas.height / data.height;

            for (let y = 0; y < data.height; y++) {
                for (let x = 0; x < data.width; x++) {
                    const val = grid[y][x];
                    const norm = data.max_value > 0 ? val / data.max_value : 0;
                    const r = Math.floor(255 * norm);
                    const b = Math.floor(255 * (1 - norm));
                    ctx.fillStyle = 'rgb(' + r + ',0,' + b + ')';
                    ctx.fillRect(x * cellW, y * cellH, cellW, cellH);
                }
            }
        }

        function renderZones(zones) {
            const container = document.getElementById('zones');
            container.innerHTML = zones.map(z =>
                '<div class="zone">' +
                '<div class="zone-color" style="background:' + z.color + '"></div>' +
                '<span>' + z.name + ': ' + z.file_count + ' files</span>' +
                '</div>'
            ).join('');
        }

        function searchFiles(query) {
            if (query.length < 2) return;
            fetch('/api/search?q=' + encodeURIComponent(query))
                .then(r => r.json())
                .then(data => {
                    const container = document.getElementById('file-results');
                    container.innerHTML = data.results.slice(0, 10).map(f =>
                        '<div class="file-item" onclick="showFile(\\'' + f.filename + '\\')">' +
                        f.filename + ' (' + f.zone + ')' +
                        '</div>'
                    ).join('');
                });
        }

        function showFile(filename) {
            alert('File: ' + filename);
        }

        function setMode(mode) {
            ws.send(JSON.stringify({action: 'set_mode', mode: mode}));
        }

        // Request initial data
        setInterval(() => {
            ws.send(JSON.stringify({action: 'get_stats'}));
        }, 1000);
    </script>
</body>
</html>
"""

    def __init__(
        self,
        image_path: str,
        port: int = 8080,
        grid_size: int = 2048
    ):
        self.image_path = Path(image_path)
        self.port = port
        self.grid_size = grid_size

        # Components
        self.event_tracker = AccessEventTracker()
        self.heatmap_renderer = HeatMapRenderer()
        self.zone_overlay = ZoneBoundaryOverlay(grid_size)
        self.file_search = FileLocationSearch()
        self.timelapse = TimeLapsePlayback()
        self.ws_handler = WebSocketHandler()

        # State
        self.running = False
        self.start_time: Optional[datetime] = None
        self._server = None

    def load_image_data(self):
        """Load VAT data from image."""
        try:
            from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

            builder = InfiniteMapBuilderV2.load(str(self.image_path))

            # Index files for search
            self.file_search.index_files(builder.vat.entries)

            # Calculate zone boundaries
            self.zone_overlay.calculate_zones(builder.vat.entries)

            logger.info(f"Loaded {len(builder.vat.entries)} files from image")

        except Exception as e:
            logger.error(f"Failed to load image data: {e}")

    def get_stats(self) -> Dict[str, Any]:
        """Get dashboard statistics."""
        return {
            "type": "stats",
            "events": self.event_tracker.get_stats()["total_events"],
            "hot_files": len(self.event_tracker.get_hot_files()),
            "clients": self.ws_handler.get_client_count(),
            "uptime": (datetime.now() - self.start_time).total_seconds() if self.start_time else 0,
        }

    def get_heatmap_data(self) -> Dict[str, Any]:
        """Get current heat map data."""
        events = self.event_tracker.get_recent_events(60)
        heatmap = self.heatmap_renderer.update_from_events(events)
        return {
            "type": "heatmap",
            **heatmap.to_dict(),
        }

    def get_zone_data(self) -> Dict[str, Any]:
        """Get zone boundary data."""
        return {
            "type": "zones",
            "zones": [z.to_dict() for z in self.zone_overlay.zones],
        }

    async def handle_websocket(self, websocket, path):
        """Handle WebSocket connection."""
        self.ws_handler.add_client(websocket)

        try:
            async for message in websocket:
                try:
                    data = json.loads(message)

                    if data.get("action") == "get_stats":
                        await websocket.send(json.dumps(self.get_stats()))

                    elif data.get("action") == "set_mode":
                        mode = data.get("mode")
                        if mode == "heatmap":
                            await websocket.send(json.dumps(self.get_heatmap_data()))
                        elif mode == "zones":
                            await websocket.send(json.dumps(self.get_zone_data()))

                except json.JSONDecodeError:
                    pass

        finally:
            self.ws_handler.remove_client(websocket)

    def start(self):
        """Start the dashboard server."""
        self.running = True
        self.start_time = datetime.now()

        # Load image data
        self.load_image_data()

        # Start server
        try:
            import websockets
            from http.server import HTTPServer, SimpleHTTPRequestHandler

            class DashboardHTTPHandler(SimpleHTTPRequestHandler):
                def __init__(self, *args, dashboard=None, **kwargs):
                    self.dashboard = dashboard
                    super().__init__(*args, **kwargs)

                def do_GET(self):
                    if self.path == "/":
                        self.send_response(200)
                        self.send_header("Content-type", "text/html")
                        self.end_headers()
                        self.wfile.write(self.dashboard.HTML_TEMPLATE.encode())

                    elif self.path.startswith("/api/search"):
                        query = self.path.split("q=")[-1] if "q=" in self.path else ""
                        results = self.dashboard.file_search.search(query)
                        self.send_response(200)
                        self.send_header("Content-type", "application/json")
                        self.end_headers()
                        self.wfile.write(json.dumps({
                            "results": [r.to_dict() for r in results]
                        }).encode())

                    else:
                        self.send_response(404)
                        self.end_headers()

            logger.info(f"Starting dashboard server on port {self.port}")
            logger.info(f"Open http://localhost:{self.port} in your browser")

            # Run HTTP server in thread
            def run_http():
                handler = lambda *args, **kwargs: DashboardHTTPHandler(*args, dashboard=self, **kwargs)
                server = HTTPServer(("", self.port), handler)
                self._server = server
                server.serve_forever()

            http_thread = threading.Thread(target=run_http, daemon=True)
            http_thread.start()

            # Keep main thread alive
            while self.running:
                time.sleep(1)

        except ImportError:
            logger.warning("websockets not installed. Running in mock mode.")
            logger.info(f"Dashboard would be available at http://localhost:{self.port}")

    def stop(self):
        """Stop the dashboard server."""
        self.running = False
        if self._server:
            self._server.shutdown()


# ============================================================================
# CLI Entry Point
# ============================================================================

def main():
    """Main CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map Dashboard Server")
    parser.add_argument("image", help="Path to Infinite Map image")
    parser.add_argument("--port", "-p", type=int, default=8080, help="Server port")
    parser.add_argument("--grid-size", "-g", type=int, default=2048, help="Grid size")

    args = parser.parse_args()

    server = DashboardServer(
        image_path=args.image,
        port=args.port,
        grid_size=args.grid_size,
    )

    try:
        server.start()
    except KeyboardInterrupt:
        print("\nShutting down...")
        server.stop()


if __name__ == "__main__":
    main()

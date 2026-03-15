"""
Geometry OS Remote Control
Allows programmatically controlling a running Geometry OS session via its API server.
"""

import requests
import json
from typing import Dict, Any, Optional

class RemoteControl:
    """Interface for controlling a running Geometry OS session."""
    
    def __init__(self, base_url: str = "http://localhost:3000"):
        self.base_url = base_url
        self.api_root = f"{base_url}/api"
        
    def get_status(self) -> Dict[str, Any]:
        """Get the current session status."""
        response = requests.get(f"{self.api_root}/status")
        response.raise_for_status()
        return response.json()
        
    def spawn_terminal(self, shell: str = "bash", x: float = 100.0, y: float = 100.0) -> Dict[str, Any]:
        """Spawn a new terminal window in the session."""
        payload = {
            "tile_id": 0, # Auto-generate
            "rows": 24,
            "cols": 80,
            "shell": shell,
            "x": x,
            "y": y
        }
        response = requests.post(f"{self.api_root}/terminal/spawn", json=payload)
        response.raise_for_status()
        return response.json()
        
    def place_glyph(self, x: int, y: int, opcode: int, stratum: int = 2, p1: int = 0, p2: int = 0) -> Dict[str, Any]:
        """Place a glyph instruction directly into VRAM."""
        payload = {
            "x": x,
            "y": y,
            "opcode": opcode,
            "stratum": stratum,
            "p1": p1,
            "p2": p2
        }
        response = requests.post(f"{self.api_root}/glyph-stratum/place", json=payload)
        response.raise_for_status()
        return response.json()
        
    def hot_patch(self, address: int, opcode: int, stratum: int = 2, p1: int = 0, p2: int = 0) -> Dict[str, Any]:
        """Hot-patch a Hilbert address."""
        # Convert address to (x, y) coordinates (Simplified for 4096 grid)
        from .core import hilbert_d2xy
        x, y = hilbert_d2xy(4096, address)
        return self.place_glyph(x, y, opcode, stratum, p1, p2)

    def load_texture(self, path: str) -> Dict[str, Any]:
        """Load an .rts.png file into the session."""
        payload = {"file_path": path}
        response = requests.post(f"{self.api_root}/load-file", json=payload)
        response.raise_for_status()
        return response.json()

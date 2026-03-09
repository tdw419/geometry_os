"""
Tectonic Physics: Translates file events into physical forces.

Implements the physics of the filesystem:
- Modification/Creation -> Expansion wave (push neighbors away)
- Deletion -> Collapse into void (pull neighbors in)
"""

import logging
from typing import Optional, Any
from .gravity_engine import GravityEngine
from .file_watcher import FileEvent

logger = logging.getLogger(__name__)

class TectonicPhysics:
    def __init__(self, gravity_engine: GravityEngine, visual_bridge: Optional[Any] = None):
        self.engine = gravity_engine
        self.visual_bridge = visual_bridge
        
        # Physics Parameters
        self.expansion_force = 2000.0
        self.expansion_radius = 300.0
        
        self.collapse_force = -4000.0
        self.collapse_radius = 500.0

    def handle_event(self, event: FileEvent):
        """
        Apply physics and emit visual events based on file event type.
        """
        orb = self.engine.get_orb(event.file_path)
        
        if not orb:
            return

        if event.event_type in ["modified", "created"]:
            logger.info(f"🌊 Expansion wave: {event.file_path}")
            self.engine.emit_ripple(
                orb["x"], orb["y"], orb["z"],
                force=self.expansion_force,
                radius=self.expansion_radius
            )
            # Emit visual feedback
            if self.visual_bridge:
                self.visual_bridge.emit_tectonic_ripple(
                    orb["x"], orb["y"], orb["z"],
                    force=self.expansion_force,
                    radius=self.expansion_radius
                )
        elif event.event_type == "deleted":
            logger.info(f"🕳️  Void collapse: {event.file_path}")
            self.engine.emit_ripple(
                orb["x"], orb["y"], orb["z"],
                force=self.collapse_force,
                radius=self.collapse_radius
            )
            # Emit visual feedback
            if self.visual_bridge:
                self.visual_bridge.emit_tectonic_ripple(
                    orb["x"], orb["y"], orb["z"],
                    force=self.collapse_force,
                    radius=self.collapse_radius
                )

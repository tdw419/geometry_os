#!/usr/bin/env python3
"""
Thought Logger - ChromaDB Integration for AI Thought Tracking

Logs every LLM thought, hex-write, and security event to ChromaDB with spatial metadata.
Enables "time-travel" UI scrubbing and semantic search across the infinite map.

Usage:
    from thought_logger import ThoughtLogger
    logger = ThoughtLogger()
    logger.log_thought("Analyzing spiral pattern", x=100, y=200)
    results = logger.search("spiral")  # Returns coordinates + timestamps
"""

import os
import sys
import json
import time
import uuid
from datetime import datetime
from pathlib import Path
from typing import Optional, List, Dict, Any

sys.path.insert(0, str(Path(__file__).parent.parent))

try:
    import chromadb
    from chromadb.config import Settings

    CHROMA_AVAILABLE = True
except ImportError:
    CHROMA_AVAILABLE = False
    print("Warning: ChromaDB not installed. Run: pip install chromadb")

# =============================================================================
# CONFIGURATION
# =============================================================================

CHROMA_DB_PATH = os.environ.get("CHROMA_DB_PATH", "./chroma_db")
COLLECTION_NAME = "geometry_thoughts"
MAX_HISTORY_DAYS = 30  # Auto-cleanup old entries

# Thought categories
THOUGHT_TYPES = {
    "analysis": "AI analyzing map state",
    "error": "Error or exception detected",
    "write": "Hex write operation",
    "security": "Security validation event",
    "navigation": "Camera/position change",
    "generation": "Content generation (LLM output)",
}

# =============================================================================
# THOUGHT LOGGER
# =============================================================================


class ThoughtLogger:
    """
    Spatial thought logging with ChromaDB vector storage.

    Each thought is stored with:
    - Text content (embedded for semantic search)
    - Timestamp
    - World coordinates (x, y)
    - Type/category
    - Agent signature (if applicable)
    """

    def __init__(self, db_path: str = CHROMA_DB_PATH, persistent: bool = True):
        self.db_path = db_path
        self.client = None
        self.collection = None

        if CHROMA_AVAILABLE:
            self._init_chroma(persistent)
        else:
            # Fallback to in-memory storage
            self._thoughts = []
            print("Running in fallback mode (in-memory only, no persistence)")

    def _init_chroma(self, persistent: bool):
        """Initialize ChromaDB client and collection."""
        if persistent:
            self.client = chromadb.PersistentClient(path=self.db_path)
        else:
            self.client = chromadb.Client()

        # Create or get collection
        self.collection = self.client.get_or_create_collection(
            name=COLLECTION_NAME, metadata={"description": "Geometry OS thought and event log"}
        )

        print(f"✓ ChromaDB initialized at {self.db_path}")

    def log_thought(
        self,
        content: str,
        x: Optional[int] = None,
        y: Optional[int] = None,
        thought_type: str = "analysis",
        agent_sig: Optional[str] = None,
        metadata: Optional[Dict] = None,
    ) -> str:
        """
        Log a thought with spatial coordinates.

        Args:
            content: The thought text (will be embedded)
            x, y: World coordinates on the infinite map
            thought_type: Category from THOUGHT_TYPES
            agent_sig: Agent signature (e.g., '0x150')
            metadata: Additional context dict

        Returns:
            Thought ID for reference
        """
        thought_id = str(uuid.uuid4())
        timestamp = datetime.utcnow().isoformat()

        # Build document
        doc = {
            "id": thought_id,
            "content": content,
            "timestamp": timestamp,
            "x": x or 0,
            "y": y or 0,
            "type": thought_type,
            "agent_sig": agent_sig or "system",
            "metadata": metadata or {},
        }

        if CHROMA_AVAILABLE and self.collection:
            # Store in ChromaDB with embedding
            self.collection.add(
                ids=[thought_id],
                documents=[content],
                metadatas=[
                    {
                        "timestamp": timestamp,
                        "x": x or 0,
                        "y": y or 0,
                        "type": thought_type,
                        "agent_sig": agent_sig or "system",
                        **metadata,
                    }
                ],
            )
        else:
            # Fallback: in-memory storage
            self._thoughts.append(doc)

        return thought_id

    def log_hex_write(self, hex_value: str, x: int, y: int, agent_sig: Optional[str] = None) -> str:
        """
        Log a hex write operation.

        Args:
            hex_value: The hex value written (e.g., '#84FF00AA')
            x, y: World coordinates
            agent_sig: Agent who performed the write

        Returns:
            Thought ID
        """
        content = f"Hex write: {hex_value} at ({x}, {y})"
        return self.log_thought(
            content=content,
            x=x,
            y=y,
            thought_type="write",
            agent_sig=agent_sig,
            metadata={"hex_value": hex_value},
        )

    def log_security_event(
        self,
        event: str,
        x: Optional[int] = None,
        y: Optional[int] = None,
        agent_sig: Optional[str] = None,
        severity: str = "warning",
    ) -> str:
        """
        Log a security validation event.

        Args:
            event: Description of the security event
            x, y: Coordinates if spatially relevant
            agent_sig: Agent involved
            severity: 'info', 'warning', 'critical'

        Returns:
            Thought ID
        """
        content = f"Security {severity}: {event}"
        return self.log_thought(
            content=content,
            x=x,
            y=y,
            thought_type="security",
            agent_sig=agent_sig,
            metadata={"severity": severity, "event": event},
        )

    def search(
        self, query: str, n_results: int = 10, thought_type: Optional[str] = None
    ) -> List[Dict]:
        """
        Search thoughts semantically.

        Args:
            query: Search text (will be embedded and matched)
            n_results: Maximum results to return
            thought_type: Filter by type if specified

        Returns:
            List of matching thoughts with coordinates
        """
        if CHROMA_AVAILABLE and self.collection:
            # ChromaDB semantic search
            results = self.collection.query(
                query_texts=[query],
                n_results=n_results,
                where={"type": thought_type} if thought_type else None,
            )

            # Format results
            formatted = []
            if results.get("documents") and results["documents"][0]:
                for i, doc in enumerate(results["documents"][0]):
                    meta = results["metadatas"][0][i] if results.get("metadatas") else {}
                    formatted.append(
                        {
                            "content": doc,
                            "timestamp": meta.get("timestamp"),
                            "x": meta.get("x"),
                            "y": meta.get("y"),
                            "type": meta.get("type"),
                            "agent_sig": meta.get("agent_sig"),
                            "distance": results["distances"][0][i]
                            if results.get("distances")
                            else None,
                        }
                    )

            return formatted
        else:
            # Fallback: simple text search in memory
            results = []
            query_lower = query.lower()
            for thought in self._thoughts:
                if query_lower in thought["content"].lower():
                    if not thought_type or thought["type"] == thought_type:
                        results.append(thought)
            return results[:n_results]

    def get_thoughts_at_location(
        self, x: int, y: int, radius: int = 10, limit: int = 20
    ) -> List[Dict]:
        """
        Get all thoughts within a spatial radius.

        Args:
            x, y: Center coordinates
            radius: Search radius in world units
            limit: Maximum results

        Returns:
            List of thoughts sorted by recency
        """
        if CHROMA_AVAILABLE and self.collection:
            # ChromaDB doesn't support spatial queries natively
            # Fall back to getting all and filtering client-side
            all_results = self.collection.get(limit=1000)

            filtered = []
            if all_results.get("metadatas"):
                for meta in all_results["metadatas"]:
                    tx, ty = meta.get("x", 0), meta.get("y", 0)
                    distance = ((tx - x) ** 2 + (ty - y) ** 2) ** 0.5
                    if distance <= radius:
                        filtered.append(
                            {
                                "content": all_results["documents"][filtered.__len__()],
                                "timestamp": meta.get("timestamp"),
                                "x": tx,
                                "y": ty,
                                "type": meta.get("type"),
                                "agent_sig": meta.get("agent_sig"),
                            }
                        )

            return filtered[:limit]
        else:
            # In-memory spatial search
            results = []
            for thought in self._thoughts:
                distance = ((thought["x"] - x) ** 2 + (thought["y"] - y) ** 2) ** 0.5
                if distance <= radius:
                    results.append(thought)

            # Sort by timestamp descending
            results.sort(key=lambda t: t["timestamp"], reverse=True)
            return results[:limit]

    def get_timeline(
        self, start_time: Optional[str] = None, end_time: Optional[str] = None, limit: int = 100
    ) -> List[Dict]:
        """
        Get thoughts within a time range for time-travel UI.

        Args:
            start_time: ISO format timestamp
            end_time: ISO format timestamp
            limit: Maximum results

        Returns:
            Chronologically sorted list of thoughts
        """
        if CHROMA_AVAILABLE and self.collection:
            all_results = self.collection.get(limit=limit * 2)  # Get extra for filtering

            filtered = []
            if all_results.get("documents"):
                for i, doc in enumerate(all_results["documents"]):
                    meta = all_results["metadatas"][i]
                    ts = meta.get("timestamp", "")

                    if start_time and ts < start_time:
                        continue
                    if end_time and ts > end_time:
                        continue

                    filtered.append(
                        {
                            "content": doc,
                            "timestamp": ts,
                            "x": meta.get("x"),
                            "y": meta.get("y"),
                            "type": meta.get("type"),
                            "agent_sig": meta.get("agent_sig"),
                        }
                    )

            # Sort chronologically
            filtered.sort(key=lambda t: t["timestamp"])
            return filtered[:limit]
        else:
            # In-memory timeline
            results = self._thoughts.copy()
            results.sort(key=lambda t: t["timestamp"])
            return results[-limit:] if not start_time else results[:limit]

    def teleport_to_error(self) -> Optional[Dict]:
        """
        Find the most recent error thought and return its coordinates.
        Used for automatic camera teleportation in UI.

        Returns:
            Dict with 'x', 'y' of last error, or None
        """
        results = self.search("error", n_results=1, thought_type="error")
        if results:
            return {"x": results[0]["x"], "y": results[0]["y"]}

        # Also check security events with critical severity
        results = self.search("critical", n_results=1, thought_type="security")
        if results:
            return {"x": results[0]["x"], "y": results[0]["y"]}

        return None

    def cleanup_old_entries(self, days: int = MAX_HISTORY_DAYS):
        """
        Remove entries older than specified days.
        Note: ChromaDB doesn't support deletion by time range efficiently.
        This is a best-effort operation.
        """
        if not CHROMA_AVAILABLE:
            cutoff = datetime.utcnow()
            from datetime import timedelta

            cutoff -= timedelta(days=days)
            self._thoughts = [
                t for t in self._thoughts if datetime.fromisoformat(t["timestamp"]) > cutoff
            ]
            print(f"Cleaned up old entries. Remaining: {len(self._thoughts)}")
            return

        # For ChromaDB, we'd need to rebuild the collection
        # This is expensive, so only do it periodically
        print("Note: Full ChromaDB cleanup requires collection rebuild (skipped)")


# =============================================================================
# THOUGHT WRAPPER FOR LLM INTEGRATION
# =============================================================================


class ThoughtWrapper:
    """
    Wrapper to intercept and log LLM thoughts automatically.

    Usage:
        wrapper = ThoughtLogger()
        with wrapper.thought_context("Processing user request", x=100, y=200):
            response = llm.generate(prompt)
            wrapper.log_generation(response)
    """

    def __init__(self, logger: ThoughtLogger):
        self.logger = logger
        self.context_stack = []

    class thought_context:
        """Context manager for logging thought sessions."""

        def __init__(self, wrapper, description, x=None, y=None):
            self.wrapper = wrapper
            self.description = description
            self.x = x
            self.y = y
            self.start_time = None

        def __enter__(self):
            self.start_time = time.time()
            self.wrapper.logger.log_thought(
                content=f"Starting: {self.description}", x=self.x, y=self.y, thought_type="analysis"
            )
            return self

        def __exit__(self, exc_type, exc_val, exc_tb):
            duration = time.time() - self.start_time
            if exc_type:
                self.wrapper.logger.log_thought(
                    content=f"Error in {self.description}: {exc_val}",
                    x=self.x,
                    y=self.y,
                    thought_type="error",
                )
            else:
                self.wrapper.logger.log_thought(
                    content=f"Completed: {self.description} ({duration:.2f}s)",
                    x=self.x,
                    y=self.y,
                    thought_type="analysis",
                )
            return False

    def log_generation(self, text: str, x: Optional[int] = None, y: Optional[int] = None):
        """Log LLM generation output."""
        # Truncate long outputs for storage
        content = text[:500] + "..." if len(text) > 500 else text
        self.logger.log_thought(
            content=f"Generated: {content}",
            x=x,
            y=y,
            thought_type="generation",
            metadata={"full_length": len(text)},
        )


# =============================================================================
# DEMO / TESTS
# =============================================================================

if __name__ == "__main__":
    print("=" * 60)
    print("THOUGHT LOGGER - CHROMADB INTEGRATION")
    print("=" * 60)

    # Initialize logger
    logger = ThoughtLogger(persistent=False)  # Use in-memory for demo
    wrapper = ThoughtWrapper(logger)

    # Log some sample thoughts
    logger.log_thought("Analyzing spiral pattern at origin", x=100, y=200)
    logger.log_hex_write("#84FF00AA", 128, 128, agent_sig="0x150")
    logger.log_security_event(
        "Unauthorized write attempt blocked", x=9999, y=9999, severity="critical"
    )

    # Use thought context
    with wrapper.thought_context("Processing geometry command", x=50, y=50):
        time.sleep(0.1)
        wrapper.log_generation("RECT(100, 100, 50, 50)", x=50, y=50)

    # Search for errors
    print("\nSearching for 'error'...")
    results = logger.search("error")
    for r in results:
        print(f"  Found at ({r['x']}, {r['y']}): {r['content'][:50]}...")

    # Teleport to error
    coords = logger.teleport_to_error()
    if coords:
        print(f"\n✓ Would teleport camera to: ({coords['x']}, {coords['y']})")

    # Get timeline
    print("\nTimeline (last 5 entries):")
    timeline = logger.get_timeline(limit=5)
    for entry in timeline:
        print(
            f"  [{entry['timestamp'][:19]}] ({entry['x']}, {entry['y']}): {entry['content'][:40]}..."
        )

    print("\n✓ Demo complete")

"""
Base Specialist Interface for AI-GUI Control Surface.

Abstract base class that all toolkit specialists (GTK, Qt, Electron) must implement.
Specialists provide semantic access to GUI applications via accessibility APIs.
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from typing import Optional, Any
from enum import Enum
import logging

logger = logging.getLogger(__name__)


@dataclass
class Widget:
    """
    Represents a widget in the GUI hierarchy.

    Widgets form a tree structure mirroring the actual GUI layout.
    """
    id: str                              # Unique widget identifier
    role: str                            # Widget role (button, entry, label, etc.)
    label: str                           # Visible label or accessible name
    path: str                            # XPath-like path in widget tree
    children: list["Widget"] = field(default_factory=list)
    bounds: Optional[tuple[int, int, int, int]] = None  # x, y, width, height
    state: Optional[set[str]] = None    # Widget state (enabled, focused, etc.)
    attributes: dict = field(default_factory=dict)  # Additional attributes
    is_interactive: bool = False         # Can receive input

    def to_dict(self) -> dict:
        """Convert widget to JSON-serializable dict."""
        return {
            "id": self.id,
            "role": self.role,
            "label": self.label,
            "path": self.path,
            "bounds": self.bounds,
            "state": list(self.state) if self.state else [],
            "attributes": self.attributes,
            "is_interactive": self.is_interactive,
            "children": [c.to_dict() for c in self.children]
        }

    def find_by_role(self, role: str) -> list["Widget"]:
        """Find all descendants with matching role."""
        results = []
        if self.role == role:
            results.append(self)
        for child in self.children:
            results.extend(child.find_by_role(role))
        return results

    def find_by_label(self, label: str, exact: bool = True) -> list["Widget"]:
        """Find all descendants with matching label."""
        results = []
        if exact and self.label == label:
            results.append(self)
        elif not exact and label.lower() in self.label.lower():
            results.append(self)
        for child in self.children:
            results.extend(child.find_by_label(label, exact))
        return results


class ShortcutSource(Enum):
    """Source of shortcut definition."""
    BUILTIN = "built-in"
    DISCOVERED = "discovered"
    INJECTED = "injected"
    SCHEMA = "schema"


@dataclass
class Shortcut:
    """
    Represents a keyboard shortcut.

    Shortcuts can come from the app itself (built-in), discovered at runtime,
    loaded from schema files, or injected by the AI.
    """
    id: str                              # Unique shortcut identifier
    keys: str                            # Key combination (e.g., "Ctrl+S")
    action: str                          # Action name (e.g., "Save")
    category: str                        # Category (file, edit, view, etc.)
    description: str = ""                # Human-readable description
    source: str = "built-in"             # built-in, discovered, injected, schema
    modifiers: list[str] = field(default_factory=list)  # ctrl, shift, alt, meta

    def to_dict(self) -> dict:
        """Convert shortcut to JSON-serializable dict."""
        return {
            "id": self.id,
            "keys": self.keys,
            "action": self.action,
            "category": self.category,
            "description": self.description,
            "source": self.source,
            "modifiers": self.modifiers
        }

    @classmethod
    def parse_keys(cls, keys: str) -> tuple[list[str], str]:
        """
        Parse key combination into modifiers and key.

        Args:
            keys: Key combination string like "Ctrl+Shift+S"

        Returns:
            Tuple of (modifiers list, key)
        """
        parts = keys.split("+")
        modifiers = [p.lower() for p in parts[:-1]]
        key = parts[-1] if parts else ""
        return modifiers, key


@dataclass
class WidgetQuery:
    """
    Query parameters for finding widgets.

    All fields are optional - only non-None fields are used for filtering.
    """
    role: Optional[str] = None           # Widget role to match
    label: Optional[str] = None          # Label to match (exact or partial)
    label_exact: bool = True             # Exact label match vs contains
    path_pattern: Optional[str] = None   # Glob pattern for path matching
    state: Optional[str] = None          # Required state (enabled, focused, etc.)
    is_interactive: Optional[bool] = None  # Filter by interactivity
    max_depth: int = 10                  # Maximum depth to search

    def matches(self, widget: Widget) -> bool:
        """Check if a widget matches this query."""
        if self.role and widget.role != self.role:
            return False
        if self.label:
            if self.label_exact:
                if widget.label != self.label:
                    return False
            else:
                if self.label.lower() not in widget.label.lower():
                    return False
        if self.state and (not widget.state or self.state not in widget.state):
            return False
        if self.is_interactive is not None and widget.is_interactive != self.is_interactive:
            return False
        if self.path_pattern:
            import fnmatch
            if not fnmatch.fnmatch(widget.path, self.path_pattern):
                return False
        return True


@dataclass
class Capabilities:
    """
    Discovered capabilities of an application.

    Aggregates findings from the discovery cascade.
    """
    toolkit: str                         # gtk, qt, electron, etc.
    app_name: str                        # Application name
    version: str = ""                    # Application version
    widgets: list[str] = field(default_factory=list)  # Widget types found
    shortcuts: list[str] = field(default_factory=list)  # Shortcut keys
    custom_actions: list[str] = field(default_factory=list)  # App-specific actions
    has_accessibility: bool = False      # Accessibility API available
    supports_injection: bool = False     # Can inject shortcuts
    discovery_sources: list[str] = field(default_factory=list)  # Sources used

    def to_dict(self) -> dict:
        """Convert capabilities to JSON-serializable dict."""
        return {
            "toolkit": self.toolkit,
            "app_name": self.app_name,
            "version": self.version,
            "widgets": self.widgets,
            "shortcuts": self.shortcuts,
            "custom_actions": self.custom_actions,
            "has_accessibility": self.has_accessibility,
            "supports_injection": self.supports_injection,
            "discovery_sources": self.discovery_sources
        }


@dataclass
class AppHandle:
    """
    Handle to a running application.

    Contains information needed to connect to and interact with the app.
    """
    app_name: str
    pid: Optional[int] = None
    window_id: Optional[str] = None
    display: Optional[str] = None
    toolkit: Optional[str] = None
    metadata: dict = field(default_factory=dict)

    def get(self, key: str, default: Any = None) -> Any:
        """Get metadata value with default."""
        if key == "name":
            return self.app_name
        if key == "pid":
            return self.pid
        return self.metadata.get(key, default)


class BaseSpecialist(ABC):
    """
    Abstract base class for toolkit specialists.

    Specialists provide semantic access to GUI applications through
    accessibility APIs and other toolkit-specific mechanisms.

    Discovery Cascade:
    1. Schemas: Load from pre-defined app schemas
    2. Accessibility: Query via AT-SPI (GTK/Qt) or CDP (Electron)
    3. Visual: Analyze screen content
    4. Exploration: Interact and observe

    Each specialist implements toolkit-specific versions of these methods.
    """

    @property
    @abstractmethod
    def toolkit(self) -> str:
        """
        Get the toolkit this specialist handles.

        Returns:
            Toolkit name (gtk, qt, electron, etc.)
        """
        pass

    @abstractmethod
    async def discover_capabilities(self, app_handle: AppHandle) -> Capabilities:
        """
        Discover all capabilities of an application.

        Implements the discovery cascade:
        1. Try loading from schema
        2. Query accessibility API
        3. Analyze visually
        4. Explore interactively

        Args:
            app_handle: Handle to the running application

        Returns:
            Capabilities object with all findings
        """
        pass

    @abstractmethod
    async def get_widget_tree(self, app_handle: AppHandle) -> Widget:
        """
        Get the widget tree of an application.

        Args:
            app_handle: Handle to the running application

        Returns:
            Root Widget with children forming the tree
        """
        pass

    @abstractmethod
    async def get_shortcuts(self, app_handle: AppHandle) -> list[Shortcut]:
        """
        Get all keyboard shortcuts for an application.

        Combines built-in, discovered, and injected shortcuts.

        Args:
            app_handle: Handle to the running application

        Returns:
            List of all known shortcuts
        """
        pass

    @abstractmethod
    async def find_widget(
        self,
        app_handle: AppHandle,
        query: WidgetQuery
    ) -> list[Widget]:
        """
        Find widgets matching a query.

        Args:
            app_handle: Handle to the running application
            query: Query parameters

        Returns:
            List of matching widgets
        """
        pass

    @abstractmethod
    async def inject_shortcut(
        self,
        app_handle: AppHandle,
        shortcut: Shortcut
    ) -> bool:
        """
        Inject a new keyboard shortcut.

        This allows the AI to add its own shortcuts for actions.

        Args:
            app_handle: Handle to the running application
            shortcut: Shortcut to inject

        Returns:
            True if injection was successful
        """
        pass

    # === Helper Methods ===

    def _load_schema(self, app_name: str) -> Optional[dict]:
        """
        Load app schema from file.

        Args:
            app_name: Application name

        Returns:
            Schema dict or None if not found
        """
        import json
        from pathlib import Path

        schema_path = Path(f"data/ai_gui/schemas/{app_name}.json")
        if schema_path.exists():
            try:
                with open(schema_path) as f:
                    return json.load(f)
            except Exception as e:
                logger.warning(f"Failed to load schema for {app_name}: {e}")
        return None

    async def _discover_from_schema(self, app_handle: AppHandle) -> Optional[Capabilities]:
        """
        Discover capabilities from schema file.

        Args:
            app_handle: Application handle

        Returns:
            Capabilities from schema or None
        """
        schema = self._load_schema(app_handle.app_name)
        if not schema:
            return None

        return Capabilities(
            toolkit=schema.get("toolkit", self.toolkit),
            app_name=app_handle.app_name,
            version=schema.get("version", ""),
            widgets=[w.get("type") for w in schema.get("widgets", {}).values()],
            shortcuts=[s.get("keys") for s in schema.get("shortcuts", [])],
            custom_actions=schema.get("custom_actions", []),
            discovery_sources=["schema"]
        )

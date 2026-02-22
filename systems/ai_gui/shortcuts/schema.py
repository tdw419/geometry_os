"""
App Schema for AI-GUI Control Surface.

Defines the structure for application capability schemas,
including shortcuts, widgets, and custom actions.
"""

import json
import logging
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Any

logger = logging.getLogger(__name__)


@dataclass
class ShortcutDefinition:
    """
    Defines a keyboard shortcut in an app schema.

    This is the schema representation, distinct from the runtime Shortcut.
    """
    keys: str                            # Key combination (e.g., "Ctrl+S")
    action: str                          # Action name
    category: str = "general"            # Category (file, edit, view, etc.)
    description: str = ""                # Human-readable description
    id: Optional[str] = None             # Optional explicit ID

    def to_dict(self) -> dict:
        """Convert to dict."""
        return {
            "keys": self.keys,
            "action": self.action,
            "category": self.category,
            "description": self.description,
            "id": self.id
        }

    @classmethod
    def from_dict(cls, data: dict) -> "ShortcutDefinition":
        """Create from dict."""
        return cls(
            keys=data["keys"],
            action=data["action"],
            category=data.get("category", "general"),
            description=data.get("description", ""),
            id=data.get("id")
        )


@dataclass
class WidgetDefinition:
    """
    Defines a widget in an app schema.

    Describes the expected widgets in an application's UI.
    """
    type: str                            # Widget type (button, entry, etc.)
    label: str = ""                      # Expected label
    description: str = ""                # Description
    items: list[str] = field(default_factory=list)  # For menus, lists, etc.
    is_interactive: bool = True          # Can receive input

    def to_dict(self) -> dict:
        """Convert to dict."""
        return {
            "type": self.type,
            "label": self.label,
            "description": self.description,
            "items": self.items,
            "is_interactive": self.is_interactive
        }

    @classmethod
    def from_dict(cls, data: dict) -> "WidgetDefinition":
        """Create from dict."""
        return cls(
            type=data["type"],
            label=data.get("label", ""),
            description=data.get("description", ""),
            items=data.get("items", []),
            is_interactive=data.get("is_interactive", True)
        )


@dataclass
class AppSchema:
    """
    Complete schema for an application.

    Defines:
    - App identification (name, version, toolkit)
    - Keyboard shortcuts
    - Widget structure
    - Custom actions specific to the app
    """
    app: str                             # Application name
    version: str = ""                    # Application version
    toolkit: str = "unknown"             # gtk, qt, electron, etc.
    shortcuts: list[ShortcutDefinition] = field(default_factory=list)
    widgets: dict[str, WidgetDefinition] = field(default_factory=dict)
    custom_actions: list[str] = field(default_factory=list)
    metadata: dict = field(default_factory=dict)

    def to_dict(self) -> dict:
        """Convert to JSON-serializable dict."""
        return {
            "app": self.app,
            "version": self.version,
            "toolkit": self.toolkit,
            "shortcuts": [s.to_dict() for s in self.shortcuts],
            "widgets": {k: v.to_dict() for k, v in self.widgets.items()},
            "custom_actions": self.custom_actions,
            "metadata": self.metadata
        }

    @classmethod
    def from_dict(cls, data: dict) -> "AppSchema":
        """Create from dict."""
        shortcuts = [
            ShortcutDefinition.from_dict(s)
            for s in data.get("shortcuts", [])
        ]

        widgets = {
            k: WidgetDefinition.from_dict(v)
            for k, v in data.get("widgets", {}).items()
        }

        return cls(
            app=data["app"],
            version=data.get("version", ""),
            toolkit=data.get("toolkit", "unknown"),
            shortcuts=shortcuts,
            widgets=widgets,
            custom_actions=data.get("custom_actions", []),
            metadata=data.get("metadata", {})
        )


class SchemaLoader:
    """
    Loads and saves app schemas from/to JSON files.
    """

    def __init__(self, schemas_dir: str = "data/ai_gui/schemas"):
        """
        Initialize schema loader.

        Args:
            schemas_dir: Directory containing schema JSON files
        """
        self._schemas_dir = Path(schemas_dir)
        self._cache: dict[str, AppSchema] = {}

    def load(self, app_name: str) -> Optional[AppSchema]:
        """
        Load schema for an application.

        Args:
            app_name: Application name

        Returns:
            AppSchema or None if not found
        """
        if app_name in self._cache:
            return self._cache[app_name]

        schema_path = self._schemas_dir / f"{app_name}.json"
        if not schema_path.exists():
            logger.debug(f"Schema not found for {app_name}")
            return None

        try:
            with open(schema_path) as f:
                data = json.load(f)

            schema = AppSchema.from_dict(data)
            self._cache[app_name] = schema
            logger.debug(f"Loaded schema for {app_name}")
            return schema

        except Exception as e:
            logger.warning(f"Failed to load schema for {app_name}: {e}")
            return None

    def save(self, schema: AppSchema) -> bool:
        """
        Save schema to file.

        Args:
            schema: Schema to save

        Returns:
            True if successful
        """
        # Ensure directory exists
        self._schemas_dir.mkdir(parents=True, exist_ok=True)

        schema_path = self._schemas_dir / f"{schema.app}.json"

        try:
            with open(schema_path, 'w') as f:
                json.dump(schema.to_dict(), f, indent=2)

            # Update cache
            self._cache[schema.app] = schema

            logger.info(f"Saved schema for {schema.app}")
            return True

        except Exception as e:
            logger.error(f"Failed to save schema for {schema.app}: {e}")
            return False

    def list_available(self) -> list[str]:
        """
        List available schemas.

        Returns:
            List of app names with schemas
        """
        if not self._schemas_dir.exists():
            return []

        return [
            f.stem for f in self._schemas_dir.glob("*.json")
        ]

    def clear_cache(self):
        """Clear the schema cache."""
        self._cache.clear()

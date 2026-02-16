"""
Shortcut Registry for AI-GUI Control Surface.

Manages keyboard shortcuts for applications, supporting:
- Built-in shortcuts (from app schemas)
- Discovered shortcuts (via accessibility APIs)
- Injected shortcuts (AI-added)
"""

import json
import logging
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional
from collections import defaultdict

logger = logging.getLogger(__name__)


@dataclass
class Shortcut:
    """
    Represents a keyboard shortcut for an application.

    Shortcuts can come from multiple sources:
    - built-in: Part of the application
    - discovered: Found via accessibility API
    - injected: Added by AI
    - schema: Loaded from schema file
    """
    id: str                              # Unique shortcut identifier
    app: str                             # Application name
    keys: str                            # Key combination (e.g., "Ctrl+S")
    action: str                          # Action name
    category: str                        # Category (file, edit, view, ai-added, etc.)
    source: str = "built-in"             # Source: built-in, discovered, injected, schema
    description: str = ""                # Human-readable description
    modifiers: list[str] = field(default_factory=list)

    def to_dict(self) -> dict:
        """Convert to JSON-serializable dict."""
        return {
            "id": self.id,
            "app": self.app,
            "keys": self.keys,
            "action": self.action,
            "category": self.category,
            "source": self.source,
            "description": self.description,
            "modifiers": self.modifiers
        }

    @classmethod
    def from_dict(cls, data: dict) -> "Shortcut":
        """Create from dict."""
        return cls(
            id=data["id"],
            app=data["app"],
            keys=data["keys"],
            action=data["action"],
            category=data.get("category", "general"),
            source=data.get("source", "built-in"),
            description=data.get("description", ""),
            modifiers=data.get("modifiers", [])
        )


class ShortcutRegistry:
    """
    Registry for keyboard shortcuts.

    Provides:
    - In-memory storage with optional persistence
    - Query by ID, keys, category, source
    - Load from schema files
    - Support for AI-injected shortcuts
    """

    def __init__(self, persistence_path: Optional[str] = None):
        """
        Initialize shortcut registry.

        Args:
            persistence_path: Optional path to JSON file for persistence
        """
        self._shortcuts: dict[str, dict[str, Shortcut]] = defaultdict(dict)
        # Structure: {app_name: {shortcut_id: Shortcut}}
        self._persistence_path = persistence_path

        # Load from persistence if available
        if persistence_path and Path(persistence_path).exists():
            self._load_from_persistence()

    def _load_from_persistence(self):
        """Load shortcuts from persistence file."""
        try:
            with open(self._persistence_path) as f:
                data = json.load(f)

            for shortcut_data in data.get("shortcuts", []):
                shortcut = Shortcut.from_dict(shortcut_data)
                self._shortcuts[shortcut.app][shortcut.id] = shortcut

            logger.info(f"Loaded {sum(len(s) for s in self._shortcuts.values())} shortcuts from {self._persistence_path}")

        except Exception as e:
            logger.warning(f"Failed to load shortcuts from persistence: {e}")

    def save(self):
        """Save shortcuts to persistence file."""
        if not self._persistence_path:
            return

        all_shortcuts = []
        for app_shortcuts in self._shortcuts.values():
            for shortcut in app_shortcuts.values():
                all_shortcuts.append(shortcut.to_dict())

        data = {"shortcuts": all_shortcuts}

        try:
            with open(self._persistence_path, 'w') as f:
                json.dump(data, f, indent=2)
            logger.debug(f"Saved {len(all_shortcuts)} shortcuts to {self._persistence_path}")
        except Exception as e:
            logger.warning(f"Failed to save shortcuts: {e}")

    def register(self, shortcut: Shortcut):
        """
        Register a shortcut.

        Args:
            shortcut: Shortcut to register
        """
        self._shortcuts[shortcut.app][shortcut.id] = shortcut
        logger.debug(f"Registered shortcut {shortcut.id} for {shortcut.app}")

    def get(self, shortcut_id: str, app: str) -> Optional[Shortcut]:
        """
        Get a shortcut by ID and app.

        Args:
            shortcut_id: Shortcut identifier
            app: Application name

        Returns:
            Shortcut or None if not found
        """
        return self._shortcuts.get(app, {}).get(shortcut_id)

    def get_by_keys(self, keys: str, app: str) -> Optional[Shortcut]:
        """
        Find shortcut by key combination.

        Args:
            keys: Key combination (e.g., "Ctrl+S")
            app: Application name

        Returns:
            Shortcut or None
        """
        for shortcut in self._shortcuts.get(app, {}).values():
            if shortcut.keys == keys:
                return shortcut
        return None

    def get_by_category(self, category: str, app: str) -> list[Shortcut]:
        """
        Get all shortcuts in a category for an app.

        Args:
            category: Category name
            app: Application name

        Returns:
            List of shortcuts
        """
        return [
            s for s in self._shortcuts.get(app, {}).values()
            if s.category == category
        ]

    def get_by_source(self, source: str, app: str) -> list[Shortcut]:
        """
        Get all shortcuts from a source for an app.

        Args:
            source: Source (built-in, discovered, injected, schema)
            app: Application name

        Returns:
            List of shortcuts
        """
        return [
            s for s in self._shortcuts.get(app, {}).values()
            if s.source == source
        ]

    def get_all(self, app: str) -> list[Shortcut]:
        """
        Get all shortcuts for an app.

        Args:
            app: Application name

        Returns:
            List of all shortcuts for the app
        """
        return list(self._shortcuts.get(app, {}).values())

    def remove(self, shortcut_id: str, app: str) -> bool:
        """
        Remove a shortcut.

        Args:
            shortcut_id: Shortcut identifier
            app: Application name

        Returns:
            True if removed, False if not found
        """
        if app in self._shortcuts and shortcut_id in self._shortcuts[app]:
            del self._shortcuts[app][shortcut_id]
            logger.debug(f"Removed shortcut {shortcut_id} from {app}")
            return True
        return False

    def count(self, app: Optional[str] = None) -> int:
        """
        Count shortcuts.

        Args:
            app: Optional app name. If None, count all.

        Returns:
            Number of shortcuts
        """
        if app:
            return len(self._shortcuts.get(app, {}))
        return sum(len(s) for s in self._shortcuts.values())

    def _load_schema(self, app: str) -> Optional[dict]:
        """
        Load app schema from file.

        Args:
            app: Application name

        Returns:
            Schema dict or None
        """
        schema_path = Path(f"data/ai_gui/schemas/{app}.json")
        if schema_path.exists():
            try:
                with open(schema_path) as f:
                    return json.load(f)
            except Exception as e:
                logger.warning(f"Failed to load schema for {app}: {e}")
        return None

    def load_from_schema(self, app: str) -> int:
        """
        Load shortcuts from app schema.

        Args:
            app: Application name

        Returns:
            Number of shortcuts loaded
        """
        schema = self._load_schema(app)
        if not schema:
            return 0

        count = 0
        for i, shortcut_data in enumerate(schema.get("shortcuts", [])):
            shortcut = Shortcut(
                id=shortcut_data.get("id", f"{app}_{shortcut_data.get('action', i).lower().replace(' ', '_')}"),
                app=app,
                keys=shortcut_data.get("keys", ""),
                action=shortcut_data.get("action", ""),
                category=shortcut_data.get("category", "general"),
                source="schema",
                description=shortcut_data.get("description", "")
            )
            self.register(shortcut)
            count += 1

        logger.info(f"Loaded {count} shortcuts from schema for {app}")
        return count

    def clear(self, app: Optional[str] = None):
        """
        Clear shortcuts.

        Args:
            app: Optional app name. If None, clear all.
        """
        if app:
            self._shortcuts[app] = {}
        else:
            self._shortcuts = defaultdict(dict)

    def list_apps(self) -> list[str]:
        """
        List all apps with registered shortcuts.

        Returns:
            List of app names
        """
        return list(self._shortcuts.keys())

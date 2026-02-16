"""
Tests for Shortcut Registry - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
Shortcut Registry manages keyboard shortcuts for applications.
"""

import pytest
import tempfile
import json
from pathlib import Path
from unittest.mock import MagicMock, patch


class TestShortcut:
    """Tests for Shortcut dataclass."""

    def test_shortcut_creation(self):
        """Should create a shortcut with all fields."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        shortcut = Shortcut(
            id="save",
            app="gedit",
            keys="Ctrl+S",
            action="Save",
            category="file",
            source="built-in",
            description="Save the current document"
        )

        assert shortcut.id == "save"
        assert shortcut.app == "gedit"
        assert shortcut.keys == "Ctrl+S"
        assert shortcut.action == "Save"

    def test_shortcut_to_dict(self):
        """Should convert to dictionary."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        shortcut = Shortcut(
            id="save",
            app="gedit",
            keys="Ctrl+S",
            action="Save",
            category="file"
        )

        d = shortcut.to_dict()

        assert d["id"] == "save"
        assert d["keys"] == "Ctrl+S"

    def test_shortcut_from_dict(self):
        """Should create from dictionary."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        d = {
            "id": "save",
            "app": "gedit",
            "keys": "Ctrl+S",
            "action": "Save",
            "category": "file",
            "source": "built-in"
        }

        shortcut = Shortcut.from_dict(d)

        assert shortcut.id == "save"
        assert shortcut.keys == "Ctrl+S"


class TestShortcutRegistry:
    """Tests for ShortcutRegistry."""

    @pytest.fixture
    def registry(self):
        """Create a fresh ShortcutRegistry."""
        from systems.ai_gui.shortcuts.registry import ShortcutRegistry
        return ShortcutRegistry()

    @pytest.fixture
    def registry_with_persistence(self):
        """Create a ShortcutRegistry with persistence."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump({"shortcuts": []}, f)
            path = f.name

        from systems.ai_gui.shortcuts.registry import ShortcutRegistry
        registry = ShortcutRegistry(persistence_path=path)

        yield registry

        Path(path).unlink(missing_ok=True)

    # === Registration Tests ===

    def test_register_shortcut(self, registry):
        """Should register a shortcut."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        shortcut = Shortcut(
            id="save",
            app="gedit",
            keys="Ctrl+S",
            action="Save",
            category="file"
        )

        registry.register(shortcut)

        assert registry.get("save", "gedit") == shortcut

    def test_register_overwrites_existing(self, registry):
        """Registering same ID should overwrite."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        s1 = Shortcut(id="save", app="gedit", keys="Ctrl+S", action="Save", category="file")
        s2 = Shortcut(id="save", app="gedit", keys="Ctrl+Shift+S", action="Save As", category="file")

        registry.register(s1)
        registry.register(s2)

        result = registry.get("save", "gedit")
        assert result.keys == "Ctrl+Shift+S"

    def test_register_multiple_apps_same_id(self, registry):
        """Same shortcut ID can exist for different apps."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        s1 = Shortcut(id="save", app="gedit", keys="Ctrl+S", action="Save", category="file")
        s2 = Shortcut(id="save", app="libreoffice", keys="Ctrl+S", action="Save", category="file")

        registry.register(s1)
        registry.register(s2)

        assert registry.get("save", "gedit").app == "gedit"
        assert registry.get("save", "libreoffice").app == "libreoffice"

    # === Query Tests ===

    def test_get_by_keys(self, registry):
        """Should find shortcut by key combination."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        shortcut = Shortcut(
            id="save",
            app="gedit",
            keys="Ctrl+S",
            action="Save",
            category="file"
        )
        registry.register(shortcut)

        result = registry.get_by_keys("Ctrl+S", "gedit")

        assert result == shortcut

    def test_get_by_category(self, registry):
        """Should list shortcuts by category."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        for i, (action, cat) in enumerate([
            ("Save", "file"),
            ("Open", "file"),
            ("Copy", "edit"),
            ("Paste", "edit"),
        ]):
            registry.register(Shortcut(
                id=action.lower(),
                app="gedit",
                keys=f"Ctrl+{action[0]}",
                action=action,
                category=cat
            ))

        file_shortcuts = registry.get_by_category("file", "gedit")

        assert len(file_shortcuts) == 2

    def test_get_all_for_app(self, registry):
        """Should get all shortcuts for an app."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        for action in ["Save", "Open", "Copy"]:
            registry.register(Shortcut(
                id=action.lower(),
                app="gedit",
                keys=f"Ctrl+{action[0]}",
                action=action,
                category="general"
            ))

        all_shortcuts = registry.get_all("gedit")

        assert len(all_shortcuts) == 3

    def test_get_nonexistent_returns_none(self, registry):
        """Getting nonexistent shortcut should return None."""
        result = registry.get("nonexistent", "gedit")
        assert result is None

    # === Source Filtering ===

    def test_get_by_source(self, registry):
        """Should filter by source."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        for action, source in [
            ("Save", "built-in"),
            ("Custom1", "injected"),
            ("Custom2", "injected"),
        ]:
            registry.register(Shortcut(
                id=action.lower(),
                app="gedit",
                keys=f"Ctrl+{action[0]}",
                action=action,
                category="general",
                source=source
            ))

        injected = registry.get_by_source("injected", "gedit")

        assert len(injected) == 2

    # === AI-Added Shortcuts ===

    def test_register_ai_shortcut(self, registry):
        """Should register AI-added shortcut."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        shortcut = Shortcut(
            id="ai_describe",
            app="gedit",
            keys="Ctrl+Alt+Shift+?",
            action="Describe State",
            category="ai-added",
            source="injected"
        )

        registry.register(shortcut)

        result = registry.get("ai_describe", "gedit")
        assert result.source == "injected"

    # === Persistence Tests ===

    def test_persistence_saves_shortcuts(self, registry_with_persistence):
        """Should persist shortcuts to file."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        registry = registry_with_persistence

        shortcut = Shortcut(
            id="save",
            app="gedit",
            keys="Ctrl+S",
            action="Save",
            category="file"
        )
        registry.register(shortcut)
        registry.save()

        # Read file
        with open(registry._persistence_path) as f:
            data = json.load(f)

        assert "shortcuts" in data
        assert len(data["shortcuts"]) == 1

    def test_persistence_loads_on_init(self):
        """Should load shortcuts from file on init."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump({
                "shortcuts": [
                    {
                        "id": "save",
                        "app": "gedit",
                        "keys": "Ctrl+S",
                        "action": "Save",
                        "category": "file"
                    }
                ]
            }, f)
            path = f.name

        try:
            from systems.ai_gui.shortcuts.registry import ShortcutRegistry

            registry = ShortcutRegistry(persistence_path=path)

            shortcut = registry.get("save", "gedit")
            assert shortcut is not None
            assert shortcut.keys == "Ctrl+S"
        finally:
            Path(path).unlink(missing_ok=True)

    # === Schema Loading ===

    def test_load_from_schema(self, registry):
        """Should load shortcuts from app schema."""
        schema = {
            "shortcuts": [
                {"keys": "Ctrl+S", "action": "Save", "category": "file"},
                {"keys": "Ctrl+O", "action": "Open", "category": "file"},
            ]
        }

        with patch.object(registry, '_load_schema', return_value=schema):
            count = registry.load_from_schema("gedit")

            assert count == 2

    # === Removal Tests ===

    def test_remove_shortcut(self, registry):
        """Should remove a shortcut."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        shortcut = Shortcut(
            id="save",
            app="gedit",
            keys="Ctrl+S",
            action="Save",
            category="file"
        )
        registry.register(shortcut)

        result = registry.remove("save", "gedit")

        assert result is True
        assert registry.get("save", "gedit") is None

    def test_remove_nonexistent_returns_false(self, registry):
        """Removing nonexistent should return False."""
        result = registry.remove("nonexistent", "gedit")
        assert result is False

    # === Statistics ===

    def test_count_shortcuts(self, registry):
        """Should count shortcuts."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        for i in range(5):
            registry.register(Shortcut(
                id=f"shortcut_{i}",
                app="gedit",
                keys=f"Ctrl+{i}",
                action=f"Action {i}",
                category="general"
            ))

        count = registry.count("gedit")
        assert count == 5

    def test_count_all_apps(self, registry):
        """Should count shortcuts across all apps."""
        from systems.ai_gui.shortcuts.registry import Shortcut

        for app in ["gedit", "libreoffice"]:
            for i in range(3):
                registry.register(Shortcut(
                    id=f"shortcut_{app}_{i}",
                    app=app,
                    keys=f"Ctrl+{i}",
                    action=f"Action {i}",
                    category="general"
                ))

        count = registry.count()
        assert count == 6

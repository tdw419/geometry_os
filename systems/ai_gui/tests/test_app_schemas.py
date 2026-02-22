"""
Tests for App Schema Format - TDD style.

Tests written BEFORE implementation following red-green-refactor cycle.
App schemas define capabilities, shortcuts, and widgets for applications.
"""

import pytest
import json
import tempfile
from pathlib import Path
from unittest.mock import patch


class TestAppSchema:
    """Tests for App Schema structure."""

    def test_schema_has_required_fields(self):
        """Schema should have required fields."""
        from systems.ai_gui.shortcuts.schema import AppSchema

        schema = AppSchema(
            app="gedit",
            version="3.38",
            toolkit="gtk"
        )

        assert schema.app == "gedit"
        assert schema.version == "3.38"
        assert schema.toolkit == "gtk"

    def test_schema_has_shortcuts(self):
        """Schema can contain shortcuts."""
        from systems.ai_gui.shortcuts.schema import AppSchema, ShortcutDefinition

        schema = AppSchema(
            app="gedit",
            version="3.38",
            toolkit="gtk",
            shortcuts=[
                ShortcutDefinition(keys="Ctrl+S", action="Save", category="file"),
                ShortcutDefinition(keys="Ctrl+O", action="Open", category="file"),
            ]
        )

        assert len(schema.shortcuts) == 2
        assert schema.shortcuts[0].keys == "Ctrl+S"

    def test_schema_has_widgets(self):
        """Schema can contain widget definitions."""
        from systems.ai_gui.shortcuts.schema import AppSchema, WidgetDefinition

        schema = AppSchema(
            app="gedit",
            version="3.38",
            toolkit="gtk",
            widgets={
                "editor": WidgetDefinition(type="text_view", label="Editor"),
                "sidebar": WidgetDefinition(type="panel", label="File Browser")
            }
        )

        assert "editor" in schema.widgets
        assert schema.widgets["editor"].type == "text_view"

    def test_schema_has_custom_actions(self):
        """Schema can define custom actions."""
        from systems.ai_gui.shortcuts.schema import AppSchema

        schema = AppSchema(
            app="gimp",
            version="2.10",
            toolkit="gtk",
            custom_actions=["filter_apply", "layer_merge", "selection_invert"]
        )

        assert len(schema.custom_actions) == 3

    def test_schema_to_dict(self):
        """Schema should convert to dict."""
        from systems.ai_gui.shortcuts.schema import AppSchema

        schema = AppSchema(
            app="gedit",
            version="3.38",
            toolkit="gtk"
        )

        d = schema.to_dict()

        assert d["app"] == "gedit"
        assert d["version"] == "3.38"
        assert d["toolkit"] == "gtk"

    def test_schema_from_dict(self):
        """Schema should load from dict."""
        from systems.ai_gui.shortcuts.schema import AppSchema

        d = {
            "app": "gedit",
            "version": "3.38",
            "toolkit": "gtk",
            "shortcuts": [
                {"keys": "Ctrl+S", "action": "Save", "category": "file"}
            ]
        }

        schema = AppSchema.from_dict(d)

        assert schema.app == "gedit"
        assert len(schema.shortcuts) == 1


class TestSchemaLoader:
    """Tests for loading schemas from files."""

    @pytest.fixture
    def temp_schema_dir(self):
        """Create a temporary directory with test schemas."""
        with tempfile.TemporaryDirectory() as tmpdir:
            schemas_dir = Path(tmpdir) / "schemas"
            schemas_dir.mkdir()

            # Create gedit schema
            gedit_schema = {
                "app": "gedit",
                "version": "3.38",
                "toolkit": "gtk",
                "shortcuts": [
                    {"keys": "Ctrl+S", "action": "Save", "category": "file"},
                    {"keys": "Ctrl+O", "action": "Open", "category": "file"},
                    {"keys": "Ctrl+Q", "action": "Quit", "category": "file"}
                ],
                "widgets": {
                    "editor": {"type": "text_view", "label": "Editor"}
                }
            }
            with open(schemas_dir / "gedit.json", 'w') as f:
                json.dump(gedit_schema, f)

            yield schemas_dir

    def test_load_schema_from_file(self, temp_schema_dir):
        """Should load schema from JSON file."""
        from systems.ai_gui.shortcuts.schema import SchemaLoader

        loader = SchemaLoader(schemas_dir=str(temp_schema_dir))
        schema = loader.load("gedit")

        assert schema is not None
        assert schema.app == "gedit"
        assert len(schema.shortcuts) == 3

    def test_load_nonexistent_returns_none(self, temp_schema_dir):
        """Loading nonexistent schema should return None."""
        from systems.ai_gui.shortcuts.schema import SchemaLoader

        loader = SchemaLoader(schemas_dir=str(temp_schema_dir))
        schema = loader.load("nonexistent")

        assert schema is None

    def test_list_available_schemas(self, temp_schema_dir):
        """Should list available schemas."""
        from systems.ai_gui.shortcuts.schema import SchemaLoader

        loader = SchemaLoader(schemas_dir=str(temp_schema_dir))
        schemas = loader.list_available()

        assert "gedit" in schemas

    def test_save_schema_to_file(self, temp_schema_dir):
        """Should save schema to JSON file."""
        from systems.ai_gui.shortcuts.schema import SchemaLoader, AppSchema

        loader = SchemaLoader(schemas_dir=str(temp_schema_dir))

        schema = AppSchema(
            app="newapp",
            version="1.0",
            toolkit="gtk"
        )

        loader.save(schema)

        # Check file was created
        assert (temp_schema_dir / "newapp.json").exists()


class TestShortcutDefinition:
    """Tests for ShortcutDefinition."""

    def test_shortcut_definition_creation(self):
        """Should create shortcut definition."""
        from systems.ai_gui.shortcuts.schema import ShortcutDefinition

        shortcut = ShortcutDefinition(
            keys="Ctrl+S",
            action="Save",
            category="file",
            description="Save the current document"
        )

        assert shortcut.keys == "Ctrl+S"
        assert shortcut.action == "Save"

    def test_shortcut_definition_defaults(self):
        """Should have sensible defaults."""
        from systems.ai_gui.shortcuts.schema import ShortcutDefinition

        shortcut = ShortcutDefinition(
            keys="Ctrl+S",
            action="Save"
        )

        assert shortcut.category == "general"
        assert shortcut.description == ""


class TestWidgetDefinition:
    """Tests for WidgetDefinition."""

    def test_widget_definition_creation(self):
        """Should create widget definition."""
        from systems.ai_gui.shortcuts.schema import WidgetDefinition

        widget = WidgetDefinition(
            type="push_button",
            label="Save",
            description="Save button"
        )

        assert widget.type == "push_button"
        assert widget.label == "Save"

    def test_widget_definition_with_items(self):
        """Widget can have child items."""
        from systems.ai_gui.shortcuts.schema import WidgetDefinition

        widget = WidgetDefinition(
            type="menu",
            label="File",
            items=["New", "Open", "Save", "Quit"]
        )

        assert len(widget.items) == 4


class TestExampleSchemas:
    """Tests for example schemas that should exist."""

    def test_gimp_schema_exists(self):
        """GIMP schema should exist with key shortcuts."""
        # Check that data/ai_gui/schemas/gimp.json exists
        schema_path = Path("data/ai_gui/schemas/gimp.json")

        if not schema_path.exists():
            pytest.skip("GIMP schema not yet created")

        with open(schema_path) as f:
            data = json.load(f)

        assert data["app"] == "gimp"
        assert len(data.get("shortcuts", [])) > 0

    def test_libreoffice_calc_schema_exists(self):
        """LibreOffice Calc schema should exist."""
        schema_path = Path("data/ai_gui/schemas/libreoffice-calc.json")

        if not schema_path.exists():
            pytest.skip("LibreOffice Calc schema not yet created")

        with open(schema_path) as f:
            data = json.load(f)

        assert data["app"] == "libreoffice-calc"

    def test_gedit_schema_exists(self):
        """gedit schema should exist."""
        schema_path = Path("data/ai_gui/schemas/gedit.json")

        if not schema_path.exists():
            pytest.skip("gedit schema not yet created")

        with open(schema_path) as f:
            data = json.load(f)

        assert data["app"] == "gedit"

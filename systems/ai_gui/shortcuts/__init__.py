"""Keyboard Shortcut management for AI-GUI interaction."""

from systems.ai_gui.shortcuts.registry import ShortcutRegistry, Shortcut
from systems.ai_gui.shortcuts.schema import (
    AppSchema,
    ShortcutDefinition,
    WidgetDefinition,
    SchemaLoader,
)

__all__ = [
    "ShortcutRegistry",
    "Shortcut",
    "AppSchema",
    "ShortcutDefinition",
    "WidgetDefinition",
    "SchemaLoader",
]

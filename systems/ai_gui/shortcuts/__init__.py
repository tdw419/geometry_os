"""Keyboard Shortcut management for AI-GUI interaction."""

from systems.ai_gui.shortcuts.registry import Shortcut, ShortcutRegistry
from systems.ai_gui.shortcuts.schema import (
    AppSchema,
    SchemaLoader,
    ShortcutDefinition,
    WidgetDefinition,
)

__all__ = [
    "ShortcutRegistry",
    "Shortcut",
    "AppSchema",
    "ShortcutDefinition",
    "WidgetDefinition",
    "SchemaLoader",
]

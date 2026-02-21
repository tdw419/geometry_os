"""
PersonalityEngine - Station personality transformation

Transforms broadcast content based on station-specific vocabulary
and style modifiers loaded from YAML configuration files.
"""

import random
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Any

import yaml


@dataclass
class StyleModifiers:
    """Configuration for content style modifications."""
    prefix_chance: float = 0.0
    prefixes: List[str] = field(default_factory=list)
    suffix_chance: float = 0.0
    suffixes: List[str] = field(default_factory=list)
    capitalize_intensifiers: bool = False
    all_caps_threshold: float = 0.0


@dataclass
class StationConfig:
    """Configuration for a radio station personality."""
    station_id: str
    name: str
    tagline: str
    style: Dict[str, str]
    vocabulary_replacements: Dict[str, str] = field(default_factory=dict)
    style_modifiers: Optional[StyleModifiers] = None
    templates: Dict[str, List[str]] = field(default_factory=dict)

    @classmethod
    def from_yaml(cls, yaml_path: Path) -> 'StationConfig':
        """Load station configuration from YAML file."""
        with open(yaml_path, 'r') as f:
            data = yaml.safe_load(f)

        # Parse style_modifiers if present
        style_modifiers = None
        if 'style_modifiers' in data:
            sm = data['style_modifiers']
            style_modifiers = StyleModifiers(
                prefix_chance=sm.get('prefix_chance', 0.0),
                prefixes=sm.get('prefixes', []),
                suffix_chance=sm.get('suffix_chance', 0.0),
                suffixes=sm.get('suffixes', []),
                capitalize_intensifiers=sm.get('capitalize_intensifiers', False),
                all_caps_threshold=sm.get('all_caps_threshold', 0.0)
            )

        return cls(
            station_id=data['station_id'],
            name=data['name'],
            tagline=data['tagline'],
            style=data['style'],
            vocabulary_replacements=data.get('vocabulary_replacements', {}),
            style_modifiers=style_modifiers,
            templates=data.get('templates', {})
        )


class PersonalityEngine:
    """
    Transforms broadcast content based on station personality.

    Loads station configurations from YAML files and applies:
    - Vocabulary replacements (word -> station-specific term)
    - Style modifiers (prefixes, suffixes, capitalization)
    """

    def __init__(self, stations_dir: Optional[Path] = None):
        """
        Initialize PersonalityEngine.

        Args:
            stations_dir: Directory containing station YAML configs.
                         Defaults to ./stations/ relative to this file.
        """
        if stations_dir is None:
            stations_dir = Path(__file__).parent / "stations"
        self.stations_dir = Path(stations_dir)
        self.stations: Dict[str, StationConfig] = {}
        self._load_stations()

    def _load_stations(self) -> None:
        """Load all station configs from the stations directory."""
        if not self.stations_dir.exists():
            return

        for yaml_file in self.stations_dir.glob("*.yaml"):
            try:
                config = StationConfig.from_yaml(yaml_file)
                self.stations[config.station_id] = config
            except Exception as e:
                # Log but don't fail - allow partial loading
                print(f"Warning: Failed to load station {yaml_file}: {e}")

    def get_station(self, station_id: str) -> Optional[StationConfig]:
        """
        Get station configuration by ID.

        Args:
            station_id: Station frequency (e.g., "87.6")

        Returns:
            StationConfig if found, None otherwise
        """
        return self.stations.get(station_id)

    def list_stations(self) -> List[str]:
        """
        List all available station IDs.

        Returns:
            List of station IDs (frequencies)
        """
        return list(self.stations.keys())

    def apply_personality(
        self,
        content: str,
        station_id: str,
        entropy: float = 0.5
    ) -> str:
        """
        Transform content with station personality.

        Applies vocabulary replacements and style modifiers
        to give content the station's unique voice.

        Args:
            content: Original content to transform
            station_id: Target station ID (e.g., "87.6")
            entropy: Current entropy level (affects randomization)

        Returns:
            Transformed content with station personality applied
        """
        station = self.get_station(station_id)
        if station is None:
            # No station found, return unchanged
            return content

        result = content

        # 1. Apply vocabulary replacements
        result = self._apply_vocabulary(result, station)

        # 2. Apply style modifiers
        if station.style_modifiers:
            result = self._apply_style_modifiers(
                result,
                station.style_modifiers,
                entropy
            )

        return result

    def _apply_vocabulary(self, content: str, station: StationConfig) -> str:
        """
        Apply vocabulary replacements to content.

        Uses word boundary matching to avoid partial replacements.
        Case-insensitive matching preserves original capitalization.
        """
        result = content

        for original, replacement in station.vocabulary_replacements.items():
            # Use word boundary regex for clean replacements
            pattern = r'\b' + re.escape(original) + r'\b'

            def replace_match(match):
                word = match.group(0)
                # Preserve capitalization
                if word.isupper():
                    return replacement.upper()
                elif word[0].isupper():
                    return replacement.capitalize()
                else:
                    return replacement

            result = re.sub(pattern, replace_match, result, flags=re.IGNORECASE)

        return result

    def _apply_style_modifiers(
        self,
        content: str,
        modifiers: StyleModifiers,
        entropy: float
    ) -> str:
        """
        Apply style modifiers: prefixes, suffixes, capitalization.

        Args:
            content: Content to modify
            modifiers: Style modifier configuration
            entropy: Current entropy level (affects randomization)
        """
        result = content

        # Apply prefix
        if modifiers.prefixes and random.random() < modifiers.prefix_chance:
            prefix = random.choice(modifiers.prefixes)
            result = f"{prefix} {result}"

        # Apply suffix
        if modifiers.suffixes and random.random() < modifiers.suffix_chance:
            suffix = random.choice(modifiers.suffixes)
            result = f"{result} {suffix}"

        # Apply all-caps threshold (for aggressive styles)
        if modifiers.all_caps_threshold > 0:
            if random.random() < modifiers.all_caps_threshold:
                # Capitalize some words randomly
                words = result.split()
                result_words = []
                for word in words:
                    if random.random() < 0.3 and len(word) > 3:
                        result_words.append(word.upper())
                    else:
                        result_words.append(word)
                result = ' '.join(result_words)

        return result

    def get_template(
        self,
        station_id: str,
        template_type: str
    ) -> Optional[str]:
        """
        Get a random template for a station and type.

        Args:
            station_id: Station ID
            template_type: Template type (e.g., "intro", "weather")

        Returns:
            Random template string, or None if not found
        """
        station = self.get_station(station_id)
        if station is None:
            return None

        templates = station.templates.get(template_type, [])
        if not templates:
            return None

        return random.choice(templates)

"""
Neural City - Phase 42 of Geometry OS

A self-organizing city of cognitive agents that emerge from brain activity.
Citizens claim territory, trade energy, and form guilds based on their function.

The brain becomes a city that builds itself.
"""

from .citizen import NeuralCitizen, CitizenState, GuildType
from .spawner import CitizenSpawner
from .territory import TerritoryMapper, Territory
from .city import NeuralCity

__all__ = [
    'NeuralCitizen',
    'CitizenState',
    'GuildType',
    'CitizenSpawner',
    'TerritoryMapper',
    'Territory',
    'NeuralCity'
]

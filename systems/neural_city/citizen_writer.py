"""
Citizen Writer - Phase 47

Citizens can write mutations back to the brain substrate.
This is the ultimate closed loop: the city modifies itself.
"""

import random
from typing import Dict, List, Tuple, Optional
import math
import time


class CitizenWriter:
    """
    Enables citizens to write mutations back to the substrate.

    This completes the Ouroboros loop:
    1. Read brain (Phase 40)
    2. Query logic (Phase 40)
    3. Detect fractures (Phase 41)
    4. Heal fractures (Phase 41)
    5. Citizens write back (Phase 47) << THE CLOSED LOOP
    """

    def __init__(self, substrate_writer):
        """
        Initialize with a substrate writer.

        Args:
            substrate_writer: Object with write_pixel(x, y, r, g, b) method
        """
        self.writer = substrate_writer
        self.writings = 0  # Track total writes
        self.writings_by_guild = {}  # Track writes per guild
        self.current_time = time.time()

    def write_activation_boost(
        self,
        x: int,
        y: int,
        radius: int,
        boost: float = 0.3,
        current_r: float = 0.5,
        current_g: float = 0.0
    ) -> bool:
        """
        Boost activation in a region.

        Citizens in high-activity zones can write to increase
        activation of nearby areas.
        """
        if not hasattr(self.writer, 'write_pixel'):
            return False

        # Apply gaussian boost
        for dy in range(-radius, radius + 1):
            for dx in range(-radius, radius + 1):
                dist = math.sqrt(dx * dx + dy * dy)
                if dist > radius:
                    continue

                # Gaussian falloff
                falloff = math.exp(-dist ** 2 / (2 * radius ** 2))
                boost_factor = boost * falloff

                px = x + dx
                py = y + dy

                # Write activation boost (red channel)
                new_r = min(1.0, current_r + boost_factor)
                new_g = max(0.0, current_g - boost_factor * 0.3)  # Reduce entropy

                self.writer.write_pixel(px, py, new_r, new_g, None)
                self.writings += 1

        return True

    def write_neural_pathway(
        self,
        start_x: int,
        start_y: int,
        end_x: int,
        end_y: int,
        opcode: str = "NOP"
    ) -> bool:
        """
        Write a neural pathway (connection between two points).

        This creates a directed connection between brain regions,
        potentially forming new computation paths.
        """
        if not hasattr(self.writer, 'write_pixel'):
            return False

        # Draw path with decreasing intensity
        steps = max(abs(end_x - start_x), abs(end_y - start_y))
        if steps == 0:
            steps = 1
        dx = (end_x - start_x) / steps
        dy = (end_y - start_y) / steps

        for i in range(steps + 1):
            t = i / steps
            px = int(start_x + dx * t)
            py = int(start_y + dy * t)

            # Intensity decreases along path
            intensity = 1.0 - (t * 0.5)

            # Base activation, low entropy (structured path)
            base_r = 0.5 * intensity
            base_g = 0.1

            # Add some variation
            noise = random.uniform(-0.1, 0.1)

            self.writer.write_pixel(
                px, py,
                base_r + noise * intensity,
                base_g + abs(noise) * 0.2,
                None
            )
            self.writings += 1

        return True

    def write_guild_territory(
        self,
        center_x: int,
        center_y: int,
        radius: int,
        guild: str
    ) -> bool:
        """
        Write a guild-specific pattern.

        Different guilds have different activation patterns:
        - Attention: High activation in center, low at edges
        - Memory: Gradient from center
        - Logic: Branching pattern
        - Substrate: Uniform low activation
        - Intent: Pulsing pattern
        """
        if not hasattr(self.writer, 'write_pixel'):
            return False

        # Get guild parameters
        guild_params = {
            'attention': {'center': 0.9, 'edge': 0.3, 'pulse': True},
            'memory': {'center': 0.7, 'edge': 0.5, 'pulse': False},
            'logic': {'center': 0.8, 'edge': 0.4, 'pulse': False, 'branching': True},
            'substrate': {'center': 0.4, 'edge': 0.2, 'pulse': False},
            'intent': {'center': 0.95, 'edge': 0.6, 'pulse': True, 'pulse_rate': 2.0}
        }

        params = guild_params.get(guild, guild_params['substrate'])

        for dy in range(-radius, radius + 1):
            for dx in range(-radius, radius + 1):
                dist = math.sqrt(dx * dx + dy * dy)
                if dist > radius:
                    continue

                # Distance ratio (0 = center, 1 = edge)
                dist_ratio = dist / radius if radius > 0 else 0

                # Activation based on position
                center_act = params['center']
                edge_act = params['edge']
                activation = center_act + (edge_act - center_act) * dist_ratio

                # Add pulsing if enabled
                if params.get('pulse', False):
                    # Time-based pulse
                    pulse = 0.5 + 0.5 * math.sin(dist_ratio * math.pi * 4)
                    activation *= pulse

                # Entropy (low for structured guilds)
                entropy = 0.05 + 0.1 * dist_ratio

                self.writer.write_pixel(
                    center_x + dx,
                    center_y + dy,
                    activation,
                    entropy,
                    None  # Preserve sector
                )
                self.writings += 1

        # Track by guild
        if guild not in self.writings_by_guild:
            self.writings_by_guild[guild] = 0
        self.writings_by_guild[guild] += 1

        return True

    def write_creative_pattern(
        self,
        x: int,
        y: int,
        pattern_type: str = "random",
        seed: int = 42
    ) -> bool:
        """
        Write creative/evolutionary patterns.

        Pattern types:
        - 'spiral': Spiral pattern from center
        - 'web': Interconnected web pattern
        - 'wave': Wave pattern
        - 'random': Random noise pattern
        - 'crystal': Crystalline structure
        """
        if not hasattr(self.writer, 'write_pixel'):
            return False

        patterns = {
            'spiral': self._write_spiral,
            'web': self._write_web,
            'wave': self._write_wave,
            'random': self._write_random,
            'crystal': self._write_crystal
        }

        if pattern_type not in patterns:
            pattern_type = 'random'

        return patterns[pattern_type](x, y, seed)

    def _write_spiral(self, x: int, y: int, seed: int) -> bool:
        for i in range(100):
            angle = i * 0.3
            r = seed * (1 - i / 100)
            spiral_x = x + int(r * math.cos(angle))
            spiral_y = y + int(r * math.sin(angle))

            activation = 0.3 + 0.7 * (i / 100)
            self.writer.write_pixel(
                spiral_x, spiral_y,
                activation,
                0.1,
                None
            )
            self.writings += 1
        return True

    def _write_web(self, x: int, y: int, seed: int) -> bool:
        # Write interconnected nodes
        nodes = []
        for i in range(8):
            angle = i * (2.5 * math.pi / (seed * (i + 1)))
            node_x = x + int(seed * math.cos(angle) * 0.6)
            node_y = y + int(seed * math.sin(angle) * 0.6)
            nodes.append((node_x, node_y))

        # Connect nodes with lines
        for i, (node_x, node_y) in enumerate(nodes):
            for j, (other_x, other_y) in enumerate(nodes):
                if i >= j:
                    continue
                for t in range(11):
                    cx = int(node_x + (other_x - node_x) * t / 10)
                    cy = int(node_y + (other_y - node_y) * t / 10)
                    self.writer.write_pixel(cx, cy, 0.6, 0.05, None)
                    self.writings += 1
        return True

    def _write_wave(self, x: int, y: int, seed: int) -> bool:
        for i in range(20):
            wave_y = y + i * 10
            for wx in range(-30, 31):
                wave_x = x + wx

                # Wave intensity
                intensity = 0.3 + 0.6 * math.sin(i / 5.0)

                self.writer.write_pixel(
                    wave_x, wave_y,
                    intensity,
                    0.05,
                    None
                )
                self.writings += 1
        return True

    def _write_random(self, x: int, y: int, seed: int) -> bool:
        random.seed(seed)
        for _ in range(50):
            rx = x + random.randint(-30, 30)
            ry = y + random.randint(-30, 30)

            activation = random.uniform(0.0, 1.0)
            entropy = random.uniform(0.0, 0.3)

            self.writer.write_pixel(
                rx, ry,
                activation,
                entropy,
                None
            )
            self.writings += 1
        return True

    def _write_crystal(self, x: int, y: int, seed: int) -> bool:
        # Crystalline structure - grid pattern
        spacing = 8
        for dx in range(-24, 25, spacing):
            for dy in range(-24, 25, spacing):
                cx = x + dx
                cy = y + dy

                # Alternating high/low activation
                if (dx + dy) % 2 == 0:
                    activation = 0.8
                else:
                    activation = 0.3

                self.writer.write_pixel(
                    cx, cy,
                    activation,
                    0.02,
                    None
                )
                self.writings += 1
        return True

    def get_stats(self) -> Dict:
        """Get writing statistics."""
        return {
            'total_writings': self.writings,
            'writings_by_guild': dict(self.writings_by_guild),
            'guild_ranking': sorted(
                self.writings_by_guild.items(),
                key=lambda x: x[1],
                reverse=True
            )
        }

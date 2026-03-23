#!/usr/bin/env python3
"""
Evolution Loop - Mutation + Selection for Self-Modifying Apps

Cycle:
  POPULATION → MUTATE → SELECT → REPLICATE → repeat

The fittest apps survive. Mutations create variety.
Natural selection optimizes for screen presence.
"""

import random
import json
import time
from dataclasses import dataclass
from typing import List
from pathlib import Path
from hex_logic_runner import GeometryToken


@dataclass
class Organism:
    """Self-modifying app"""
    genome: bytearray
    x: int
    y: int
    fitness: float = 0.0
    generation: int = 0


class EvolutionLoop:
    """Mutation + Selection engine"""

    def __init__(self, width=1920, height=1080):
        self.width = width
        self.height = height
        self.population: List[Organism] = []
        self.generation = 0

    def spawn(self, count=10):
        """Create initial population"""
        for i in range(count):
            genome = self._random_genome()
            org = Organism(
                genome=genome,
                x=(i % 5) * 300 + 100,
                y=(i // 5) * 200 + 100
            )
            self.population.append(org)
        return self.population

    def _random_genome(self) -> bytearray:
        """Generate random app genome"""
        g = bytearray()
        g.append(GeometryToken.LAYER)
        g.extend((100).to_bytes(2, 'little'))
        g.append(GeometryToken.COLOR)
        g.extend(bytes([random.randint(0,255) for _ in range(4)]))

        if random.random() > 0.5:
            g.append(GeometryToken.RECT)
            g.extend((random.randint(50,150)).to_bytes(2, 'little', signed=True))
            g.extend((random.randint(50,150)).to_bytes(2, 'little', signed=True))
            g.extend((random.randint(30,80)).to_bytes(2, 'little'))
            g.extend((random.randint(30,80)).to_bytes(2, 'little'))
        else:
            g.append(GeometryToken.CIRC)
            g.extend((random.randint(50,150)).to_bytes(2, 'little', signed=True))
            g.extend((random.randint(50,150)).to_bytes(2, 'little', signed=True))
            g.extend((random.randint(15,40)).to_bytes(2, 'little'))

        g.extend(bytes([random.randint(0,255) for _ in range(4)]))
        g.append(GeometryToken.LISTEN)
        g.extend((50).to_bytes(2, 'little'))
        return g

    def mutate(self, org: Organism) -> Organism:
        """Apply random mutations"""
        genome = bytearray(org.genome)
        for i in range(len(genome)):
            if random.random() < 0.1:  # 10% mutation rate
                op = random.randint(0, 3)
                if op == 0:
                    genome[i] = (genome[i] + 1) & 0xFF
                elif op == 1:
                    genome[i] = (genome[i] - 1) & 0xFF
                elif op == 2:
                    genome[i] = ~genome[i] & 0xFF
                else:
                    genome[i] = random.randint(0, 255)

        return Organism(
            genome=genome,
            x=org.x + random.randint(-30, 30),
            y=org.y + random.randint(-30, 30),
            generation=self.generation + 1
        )

    def fitness(self, org: Organism) -> float:
        """Calculate fitness score"""
        score = 0.0
        g = org.genome

        # Reward visual output
        if GeometryToken.RECT in g: score += 10
        if GeometryToken.CIRC in g: score += 10
        if GeometryToken.TEXT in g: score += 5

        # Reward interaction
        if GeometryToken.LISTEN in g: score += 5

        # Penalize size
        score -= len(g) * 0.05

        # Penalize off-screen
        if org.x < 0 or org.x > self.width: score -= 5
        if org.y < 0 or org.y > self.height: score -= 5

        org.fitness = max(0, score)
        return org.fitness

    def select(self) -> List[Organism]:
        """Natural selection - keep top 30%"""
        for org in self.population:
            self.fitness(org)

        self.population.sort(key=lambda o: o.fitness, reverse=True)
        return self.population[:max(1, len(self.population) // 3)]

    def evolve(self, generations=10):
        """Run evolution loop"""
        for _ in range(generations):
            self.generation += 1

            # Select fittest
            survivors = self.select()

            # Reproduce
            offspring = []
            for s in survivors:
                for _ in range(random.randint(1, 3)):
                    offspring.append(self.mutate(s))

            # New population
            self.population = survivors + offspring
            while len(self.population) < 10:
                self.population.append(Organism(
                    genome=self._random_genome(),
                    x=random.randint(100, self.width-100),
                    y=random.randint(100, self.height-100)
                ))

        return self.population

    def to_json(self):
        """Export state for browser visualization"""
        return {
            "generation": self.generation,
            "organisms": [
                {
                    "x": o.x,
                    "y": o.y,
                    "fitness": o.fitness,
                    "type": o.genome[4] % 4 if len(o.genome) > 4 else 0
                }
                for o in self.population
            ]
        }


if __name__ == "__main__":
    print("EVOLUTION LOOP")
    print("=" * 40)

    evo = EvolutionLoop()
    evo.spawn(15)

    print(f"\nGen 0: {len(evo.population)} organisms")

    evo.evolve(10)

    print(f"\nGen {evo.generation}: {len(evo.population)} organisms")

    print("\nTop 5:")
    for org in sorted(evo.population, key=lambda o: o.fitness, reverse=True)[:5]:
        print(f"  Fit={org.fitness:.1f} Gen={org.generation} "
              f"@({org.x},{org.y}) {len(org.genome)}B")

    print("\n🔷🔒 Evolution Active")

"""
Geometry OS: Synthetic Teacher

Generates massive datasets of (Intent -> Resonance Glyph) pairs
verified by the GPU Auditor for training geometric AI.

Architecture:
- Intent Parser: Natural language to structured intent
- Glyph Generator: Intent to glyph encoding candidates
- GPU Auditor: WebGPU verification of glyph correctness
- Training Data Export: JSONL format for fine-tuning

Epoch 3: The Native Mind
"""

import json
import random
import hashlib
from dataclasses import dataclass, field, asdict
from typing import List, Dict, Optional, Tuple, Any
from datetime import datetime
from pathlib import Path
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================
# DATA STRUCTURES
# ============================================

@dataclass
class Intent:
    """Structured intent from natural language."""
    operation: str  # e.g., "add", "load", "store"
    operands: List[int]  # e.g., [5, 3]
    input_types: List[str]  # e.g., ["i32", "i32"]
    output_type: str  # e.g., "i32"
    constraints: Dict[str, Any] = field(default_factory=dict)
    natural_language: str = ""


@dataclass
class GlyphEncoding:
    """A resonance glyph encoding."""
    opcode: int
    operand: int
    atlas_x: int
    atlas_y: int
    position: Tuple[int, int]  # x, y on infinite map
    confidence: float = 0.0
    verified: bool = False


@dataclass
class TrainingPair:
    """A verified Intent -> Glyph pair for training."""
    intent: Intent
    glyphs: List[GlyphEncoding]
    expected_output: Any
    actual_output: Any
    verified: bool
    verification_score: float
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())
    pair_id: str = field(default_factory=lambda: hashlib.md5(str(datetime.now()).encode()).hexdigest()[:8])


# ============================================
# INTENT PARSER
# ============================================

class IntentParser:
    """Parse natural language into structured intents."""

    # Operation patterns
    PATTERNS = {
        r"add (\d+) and (\d+)": ("add", ["i32", "i32"], "i32"),
        r"subtract (\d+) from (\d+)": ("sub", ["i32", "i32"], "i32"),
        r"multiply (\d+) by (\d+)": ("mul", ["i32", "i32"], "i32"),
        r"divide (\d+) by (\d+)": ("div", ["i32", "i32"], "i32"),
        r"load from address (\d+)": ("load", ["ptr"], "i32"),
        r"store (\d+) at address (\d+)": ("store", ["i32", "ptr"], "void"),
        r"compare (\d+) and (\d+)": ("eq", ["i32", "i32"], "i32"),
        r"is (\d+) greater than (\d+)": ("gt", ["i32", "i32"], "i32"),
        r"is (\d+) less than (\d+)": ("lt", ["i32", "i32"], "i32"),
        r"(\w+)\s*\(\s*(\d+)\s*,\s*(\d+)\s*\)": None,  # Generic function call
    }

    # Opcode mappings
    OPCODES = {
        "add": 0x6A, "sub": 0x6B, "mul": 0x6C, "div": 0x6D,
        "load": 0x28, "store": 0x36,
        "eq": 0x46, "ne": 0x47, "lt": 0x48, "gt": 0x4A,
        "and": 0x71, "or": 0x72, "xor": 0x73,
        "nop": 0x01, "return": 0x0F,
    }

    def parse(self, text: str) -> Intent:
        """Parse natural language into structured intent."""
        import re

        text = text.lower().strip()

        # Try pattern matching
        for pattern, (op, inputs, output) in self.PATTERNS.items():
            if pattern.startswith(r"(\w+)"):
                continue  # Skip generic pattern

            match = re.match(pattern, text)
            if match:
                operands = [int(g) for g in match.groups()]
                return Intent(
                    operation=op,
                    operands=operands,
                    input_types=inputs,
                    output_type=output,
                    natural_language=text
                )

        # Try generic function call
        generic = re.match(r"(\w+)\s*\(\s*(\d+)\s*(?:,\s*(\d+)\s*)?\)", text)
        if generic:
            op = generic.group(1)
            operands = [int(g) for g in generic.groups()[1:] if g]

            if op in self.OPCODES:
                input_count = len(operands)
                return Intent(
                    operation=op,
                    operands=operands,
                    input_types=["i32"] * input_count,
                    output_type="i32",
                    natural_language=text
                )

        # Default to unknown
        return Intent(
            operation="unknown",
            operands=[],
            input_types=[],
            output_type="void",
            natural_language=text
        )

    def generate_random_intent(self) -> Intent:
        """Generate a random intent for training diversity."""
        operations = ["add", "sub", "mul", "div", "and", "or", "xor", "eq", "lt", "gt"]

        op = random.choice(operations)
        operands = [random.randint(0, 100), random.randint(1, 100)]  # Avoid div by 0

        nl_templates = {
            "add": f"add {operands[0]} and {operands[1]}",
            "sub": f"subtract {operands[1]} from {operands[0]}",
            "mul": f"multiply {operands[0]} by {operands[1]}",
            "div": f"divide {operands[0]} by {operands[1]}",
            "and": f"bitwise and of {operands[0]} and {operands[1]}",
            "or": f"bitwise or of {operands[0]} and {operands[1]}",
            "xor": f"bitwise xor of {operands[0]} and {operands[1]}",
            "eq": f"compare {operands[0]} and {operands[1]}",
            "lt": f"is {operands[0]} less than {operands[1]}",
            "gt": f"is {operands[0]} greater than {operands[1]}",
        }

        return Intent(
            operation=op,
            operands=operands,
            input_types=["i32", "i32"],
            output_type="i32",
            natural_language=nl_templates[op]
        )


# ============================================
# GLYPH GENERATOR
# ============================================

class GlyphGenerator:
    """Generate glyph encodings from intents."""

    OPCODES = IntentParser.OPCODES

    # Opcode to atlas position mapping
    ATLAS_MAP = {
        0x01: (1, 0),   # nop
        0x0F: (15, 0),  # return
        0x20: (0, 2),   # local.get
        0x21: (1, 2),   # local.set
        0x28: (8, 2),   # i32.load
        0x36: (6, 3),   # i32.store
        0x41: (9, 4),   # i32.const
        0x46: (14, 4),  # i32.eq
        0x47: (15, 4),  # i32.ne
        0x48: (0, 4),   # i32.lt_s
        0x4A: (10, 4),  # i32.gt_s
        0x6A: (10, 6),  # i32.add
        0x6B: (11, 6),  # i32.sub
        0x6C: (12, 6),  # i32.mul
        0x6D: (13, 6),  # i32.div_s
        0x71: (1, 7),   # i32.and
        0x72: (2, 7),   # i32.or
        0x73: (3, 7),   # i32.xor
    }

    def generate(self, intent: Intent, origin: Tuple[int, int] = (0, 0)) -> List[GlyphEncoding]:
        """Generate glyph sequence for an intent."""
        glyphs = []
        x, y = origin

        op = intent.operation

        if op in ["add", "sub", "mul", "div", "and", "or", "xor", "eq", "lt", "gt"]:
            # Binary operation: local.get a, local.get b, op, return
            glyphs.append(self._create_glyph(0x20, 0, (x, y)))  # local.get 0
            glyphs.append(self._create_glyph(0x20, 1, (x+1, y)))  # local.get 1
            glyphs.append(self._create_glyph(self.OPCODES[op], 0, (x+2, y)))  # operation
            glyphs.append(self._create_glyph(0x0F, 0, (x+3, y)))  # return

        elif op == "load":
            # Load: local.get addr, i32.load, return
            glyphs.append(self._create_glyph(0x20, 0, (x, y)))
            glyphs.append(self._create_glyph(0x28, 0, (x+1, y)))
            glyphs.append(self._create_glyph(0x0F, 0, (x+2, y)))

        elif op == "store":
            # Store: local.get addr, local.get value, i32.store, return
            glyphs.append(self._create_glyph(0x20, 0, (x, y)))
            glyphs.append(self._create_glyph(0x20, 1, (x+1, y)))
            glyphs.append(self._create_glyph(0x36, 0, (x+2, y)))
            glyphs.append(self._create_glyph(0x0F, 0, (x+3, y)))

        else:
            # Unknown: just nop
            glyphs.append(self._create_glyph(0x01, 0, (x, y)))

        return glyphs

    def _create_glyph(self, opcode: int, operand: int, position: Tuple[int, int]) -> GlyphEncoding:
        """Create a glyph encoding."""
        atlas_x, atlas_y = self.ATLAS_MAP.get(opcode, (0, 0))
        return GlyphEncoding(
            opcode=opcode,
            operand=operand,
            atlas_x=atlas_x,
            atlas_y=atlas_y,
            position=position
        )

    def generate_variants(self, intent: Intent, count: int = 5) -> List[List[GlyphEncoding]]:
        """Generate multiple glyph variants for an intent."""
        variants = []

        # Correct variant
        variants.append(self.generate(intent))

        # Variants with different register allocations
        for i in range(count - 1):
            origin = (random.randint(0, 100), random.randint(0, 100))
            variant = self.generate(intent, origin)

            # Add some noise/confidence variation
            for glyph in variant:
                glyph.confidence = random.uniform(0.7, 1.0)

            variants.append(variant)

        return variants


# ============================================
# GPU AUDITOR
# ============================================

class GPUAuditor:
    """
    Verify glyph encodings using WebGPU execution.

    In production, this would:
    1. Load glyphs into WebGPU texture
    2. Execute compute shader
    3. Compare output to expected result
    """

    # Reference implementations for verification
    REFERENCE_IMPLS = {
        "add": lambda a, b: a + b,
        "sub": lambda a, b: a - b,
        "mul": lambda a, b: a * b,
        "div": lambda a, b: a // b if b != 0 else 0,
        "and": lambda a, b: a & b,
        "or": lambda a, b: a | b,
        "xor": lambda a, b: a ^ b,
        "eq": lambda a, b: 1 if a == b else 0,
        "lt": lambda a, b: 1 if a < b else 0,
        "gt": lambda a, b: 1 if a > b else 0,
        "load": lambda addr: 0,  # Placeholder
        "store": lambda addr, val: None,
    }

    def verify(self, intent: Intent, glyphs: List[GlyphEncoding]) -> Tuple[bool, float, Any]:
        """
        Verify glyph encoding produces correct result.
        Returns (is_correct, confidence_score, actual_output)
        """
        op = intent.operation

        if op not in self.REFERENCE_IMPLS:
            return False, 0.0, None

        try:
            # Compute expected output
            ref_func = self.REFERENCE_IMPLS[op]

            if len(intent.operands) == 2:
                expected = ref_func(intent.operands[0], intent.operands[1])
            elif len(intent.operands) == 1:
                expected = ref_func(intent.operands[0])
            else:
                expected = ref_func()

            # Simulate GPU execution (would be actual WebGPU call in production)
            actual = self._simulate_execution(glyphs, intent.operands)

            # Verify match
            is_correct = actual == expected
            confidence = 1.0 if is_correct else 0.0

            return is_correct, confidence, actual

        except Exception as e:
            logger.error(f"Verification error: {e}")
            return False, 0.0, None

    def _simulate_execution(self, glyphs: List[GlyphEncoding], operands: List[int]) -> Any:
        """
        Simulate WebGPU execution of glyph sequence.

        This is a simplified simulation. Real implementation would:
        1. Upload glyph texture to GPU
        2. Run compute shader
        3. Read back results
        """
        # Stack-based VM simulation
        stack = []
        locals_dict = {i: v for i, v in enumerate(operands)}

        for glyph in glyphs:
            if glyph.opcode == 0x20:  # local.get
                stack.append(locals_dict.get(glyph.operand, 0))
            elif glyph.opcode == 0x21:  # local.set
                if stack:
                    locals_dict[glyph.operand] = stack.pop()
            elif glyph.opcode == 0x6A:  # i32.add
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a + b)
            elif glyph.opcode == 0x6B:  # i32.sub
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a - b)
            elif glyph.opcode == 0x6C:  # i32.mul
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a * b)
            elif glyph.opcode == 0x6D:  # i32.div_s
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a // b if b != 0 else 0)
            elif glyph.opcode == 0x71:  # i32.and
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a & b)
            elif glyph.opcode == 0x72:  # i32.or
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a | b)
            elif glyph.opcode == 0x73:  # i32.xor
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(a ^ b)
            elif glyph.opcode == 0x46:  # i32.eq
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(1 if a == b else 0)
            elif glyph.opcode == 0x48:  # i32.lt_s
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(1 if a < b else 0)
            elif glyph.opcode == 0x4A:  # i32.gt_s
                if len(stack) >= 2:
                    b, a = stack.pop(), stack.pop()
                    stack.append(1 if a > b else 0)
            elif glyph.opcode == 0x0F:  # return
                return stack[-1] if stack else 0

        return stack[-1] if stack else 0


# ============================================
# SYNTHETIC TEACHER
# ============================================

class SyntheticTeacher:
    """
    Main orchestrator for generating training data.
    """

    def __init__(self, output_dir: str = "./training_data"):
        self.parser = IntentParser()
        self.generator = GlyphGenerator()
        self.auditor = GPUAuditor()
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

        self.stats = {
            "total_pairs": 0,
            "verified_pairs": 0,
            "failed_pairs": 0,
            "operations": {}
        }

    def generate_pair(self, natural_language: str = None) -> TrainingPair:
        """Generate a single training pair."""
        # Parse or generate intent
        if natural_language:
            intent = self.parser.parse(natural_language)
        else:
            intent = self.parser.generate_random_intent()

        # Generate glyphs
        glyphs = self.generator.generate(intent)

        # Verify with GPU auditor
        verified, score, actual = self.auditor.verify(intent, glyphs)

        # Calculate expected output
        op = intent.operation
        if op in self.auditor.REFERENCE_IMPLS and len(intent.operands) >= 2:
            expected = self.auditor.REFERENCE_IMPLS[op](
                intent.operands[0], intent.operands[1]
            )
        else:
            expected = None

        pair = TrainingPair(
            intent=intent,
            glyphs=glyphs,
            expected_output=expected,
            actual_output=actual,
            verified=verified,
            verification_score=score
        )

        # Update stats
        self.stats["total_pairs"] += 1
        if verified:
            self.stats["verified_pairs"] += 1
        else:
            self.stats["failed_pairs"] += 1

        op_stats = self.stats["operations"].setdefault(op, {"total": 0, "verified": 0})
        op_stats["total"] += 1
        if verified:
            op_stats["verified"] += 1

        return pair

    def generate_batch(self, count: int = 100, include_nl: List[str] = None) -> List[TrainingPair]:
        """Generate a batch of training pairs."""
        pairs = []

        # Include specific natural language examples
        if include_nl:
            for nl in include_nl:
                pairs.append(self.generate_pair(nl))

        # Generate random pairs
        remaining = count - len(pairs)
        for _ in range(remaining):
            pairs.append(self.generate_pair())

        logger.info(f"Generated {len(pairs)} pairs, {self.stats['verified_pairs']} verified")
        return pairs

    def export_jsonl(self, pairs: List[TrainingPair], filename: str = "training_data.jsonl") -> Path:
        """Export pairs to JSONL format for training."""
        filepath = self.output_dir / filename

        with open(filepath, 'w') as f:
            for pair in pairs:
                if pair.verified:  # Only export verified pairs
                    record = {
                        "pair_id": pair.pair_id,
                        "timestamp": pair.timestamp,
                        "natural_language": pair.intent.natural_language,
                        "operation": pair.intent.operation,
                        "operands": pair.intent.operands,
                        "expected_output": pair.expected_output,
                        "glyphs": [
                            {
                                "opcode": g.opcode,
                                "operand": g.operand,
                                "atlas_x": g.atlas_x,
                                "atlas_y": g.atlas_y,
                                "position": g.position
                            }
                            for g in pair.glyphs
                        ],
                        "verification_score": pair.verification_score
                    }
                    f.write(json.dumps(record) + "\n")

        logger.info(f"Exported {len([p for p in pairs if p.verified])} verified pairs to {filepath}")
        return filepath

    def export_for_finetuning(self, pairs: List[TrainingPair], filename: str = "finetune_data.jsonl") -> Path:
        """
        Export in format suitable for LLM fine-tuning.
        Format: {"messages": [{"role": "user", "content": ...}, {"role": "assistant", "content": ...}]}
        """
        filepath = self.output_dir / filename

        with open(filepath, 'w') as f:
            for pair in pairs:
                if not pair.verified:
                    continue

                # Create glyph representation
                glyph_str = " ".join([
                    f"[{g.opcode:02X}:{g.operand}]"
                    for g in pair.glyphs
                ])

                record = {
                    "messages": [
                        {
                            "role": "user",
                            "content": f"Generate glyphs for: {pair.intent.natural_language}"
                        },
                        {
                            "role": "assistant",
                            "content": glyph_str
                        }
                    ]
                }
                f.write(json.dumps(record) + "\n")

        logger.info(f"Exported fine-tuning data to {filepath}")
        return filepath

    def get_stats(self) -> Dict[str, Any]:
        """Get generation statistics."""
        return {
            **self.stats,
            "verification_rate": (
                self.stats["verified_pairs"] / self.stats["total_pairs"]
                if self.stats["total_pairs"] > 0 else 0
            )
        }

    def reset_stats(self):
        """Reset statistics."""
        self.stats = {
            "total_pairs": 0,
            "verified_pairs": 0,
            "failed_pairs": 0,
            "operations": {}
        }


# ============================================
# CLI INTERFACE
# ============================================

def main():
    """CLI for Synthetic Teacher."""
    import argparse

    parser = argparse.ArgumentParser(description="Geometry OS Synthetic Teacher")
    parser.add_argument("--count", type=int, default=100, help="Number of pairs to generate")
    parser.add_argument("--output", type=str, default="./training_data", help="Output directory")
    parser.add_argument("--seed", type=int, default=None, help="Random seed")

    args = parser.parse_args()

    if args.seed is not None:
        random.seed(args.seed)

    teacher = SyntheticTeacher(output_dir=args.output)

    # Generate training pairs
    pairs = teacher.generate_batch(args.count)

    # Export
    teacher.export_jsonl(pairs, "synthetic_training.jsonl")
    teacher.export_for_finetuning(pairs, "synthetic_finetune.jsonl")

    # Print stats
    stats = teacher.get_stats()
    print(f"\nGeneration Statistics:")
    print(f"  Total pairs: {stats['total_pairs']}")
    print(f"  Verified: {stats['verified_pairs']}")
    print(f"  Failed: {stats['failed_pairs']}")
    print(f"  Verification rate: {stats['verification_rate']:.1%}")

    print(f"\nBy operation:")
    for op, op_stats in stats['operations'].items():
        rate = op_stats['verified'] / op_stats['total'] if op_stats['total'] > 0 else 0
        print(f"  {op}: {op_stats['verified']}/{op_stats['total']} ({rate:.1%})")


if __name__ == "__main__":
    main()

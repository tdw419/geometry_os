"""
GeoASM Forge - GeoASM Program Modification

Provides tools for disassembling, assembling, optimizing, and mutating
GeoASM neural assembly programs.
"""

import logging
import random

logger = logging.getLogger(__name__)

# Import from existing GeoASM module
try:
    from systems.visual_shell.geoasm.instruction import Instruction, Opcode
    GEOASM_AVAILABLE = True
except ImportError:
    GEOASM_AVAILABLE = False
    # Define minimal versions for testing without full dependency
    from enum import IntEnum

    class Opcode(IntEnum):
        EMBED = 0xD0
        ATTEND = 0xD1
        PROJECT = 0xD2
        SAMPLE = 0xD3
        LAYER = 0xD4
        KV_APPEND = 0xD5
        THOUGHT_PULSE = 0xD6

    class Instruction:
        def __init__(self, opcode, rd=0, rs=0, imm=0):
            self.opcode = opcode
            self.rd = rd
            self.rs = rs
            self.imm = imm

        def to_bytes(self) -> bytes:
            return bytes([
                self.opcode.value,
                self.rs & 0x07,
                self.rd & 0x07,
                self.imm & 0xFF,
            ])

        @classmethod
        def from_bytes(cls, data: bytes) -> "Instruction":
            if len(data) < 4:
                raise ValueError(f"Instruction requires 4 bytes, got {len(data)}")
            opcode = Opcode(data[0])
            rs = data[1] & 0x07
            rd = data[2] & 0x07
            imm = data[3]
            return cls(opcode=opcode, rd=rd, rs=rs, imm=imm)


class GeoASMForge:
    """
    GeoASM program manipulation toolkit.

    Enables inspection, modification, optimization, and mutation of
    GeoASM neural assembly programs.

    Example:
        forge = GeoASMForge()

        # Disassemble a program
        with open('program.rts.bin', 'rb') as f:
            program = f.read()
        instructions = forge.disassemble(program)

        # Optimize the program
        optimized = forge.optimize(program)

        # Apply random mutations
        mutated = forge.mutate(program, mutation_rate=0.1)

        # Assemble back to bytes
        new_program = forge.assemble(instructions)
    """

    # Opcode categories for intelligent mutation
    COMPUTE_OPCODES = [Opcode.ATTEND, Opcode.PROJECT, Opcode.EMBED]
    CONTROL_OPCODES = [Opcode.LAYER]
    IO_OPCODES = [Opcode.SAMPLE, Opcode.THOUGHT_PULSE]
    MEMORY_OPCODES = [Opcode.KV_APPEND]

    def __init__(self):
        """Initialize the GeoASM Forge."""
        self._mutation_history: list[dict] = []

    def disassemble(self, program: bytes) -> list[Instruction]:
        """
        Disassemble a GeoASM program from bytes.

        Args:
            program: Raw program bytes (4 bytes per instruction)

        Returns:
            List of Instruction objects
        """
        instructions = []

        for i in range(0, len(program), 4):
            if i + 4 <= len(program):
                inst_bytes = program[i:i+4]
                try:
                    inst = Instruction.from_bytes(inst_bytes)
                    instructions.append(inst)
                except ValueError as e:
                    logger.warning(f"Failed to decode instruction at offset {i}: {e}")

        logger.info(f"Disassembled {len(instructions)} instructions from {len(program)} bytes")
        return instructions

    def assemble(self, instructions: list[Instruction]) -> bytes:
        """
        Assemble a list of instructions into bytes.

        Args:
            instructions: List of Instruction objects

        Returns:
            Raw program bytes
        """
        program = b''.join(inst.to_bytes() for inst in instructions)

        logger.info(f"Assembled {len(instructions)} instructions into {len(program)} bytes")
        return program

    def optimize(self, program: bytes) -> bytes:
        """
        Optimize a GeoASM program by removing redundant operations.

        Args:
            program: Raw program bytes

        Returns:
            Optimized program bytes
        """
        instructions = self.disassemble(program)
        original_count = len(instructions)

        optimized = []

        i = 0
        while i < len(instructions):
            inst = instructions[i]

            # Skip redundant LAYER instructions (same layer repeated)
            if inst.opcode == Opcode.LAYER:
                if optimized and optimized[-1].opcode == Opcode.LAYER:
                    if optimized[-1].imm == inst.imm:
                        # Skip duplicate LAYER
                        i += 1
                        continue

            # Skip no-op register moves (same source and dest)
            if inst.opcode in (Opcode.EMBED, Opcode.ATTEND, Opcode.PROJECT, Opcode.SAMPLE):
                if inst.rs == inst.rd:
                    # Check if this is truly a no-op (depends on context)
                    # For now, keep these as they may have side effects
                    pass

            optimized.append(inst)
            i += 1

        # Remove trailing LAYER instructions (no effect)
        while optimized and optimized[-1].opcode == Opcode.LAYER:
            optimized.pop()

        result = self.assemble(optimized)

        reduction = original_count - len(optimized)
        if reduction > 0:
            logger.info(f"Optimized: removed {reduction} redundant instructions")

        return result

    def mutate(
        self,
        program: bytes,
        mutation_rate: float = 0.1,
        mutation_types: list[str] | None = None
    ) -> bytes:
        """
        Apply random mutations to a GeoASM program.

        Args:
            program: Raw program bytes
            mutation_rate: Probability of mutating each instruction (0-1)
            mutation_types: Types of mutations to apply (default: all)

        Returns:
            Mutated program bytes
        """
        if mutation_types is None:
            mutation_types = ['opcode', 'register', 'immediate', 'insert', 'delete']

        instructions = self.disassemble(program)
        mutated = []

        mutations_applied = {
            'opcode': 0,
            'register': 0,
            'immediate': 0,
            'insert': 0,
            'delete': 0,
        }

        for i, inst in enumerate(instructions):
            if random.random() < mutation_rate:
                # Apply a random mutation
                mutation_type = random.choice(mutation_types)

                if mutation_type == 'opcode':
                    # Change opcode to a related one
                    inst = self._mutate_opcode(inst)
                    mutations_applied['opcode'] += 1

                elif mutation_type == 'register':
                    # Change register assignment
                    inst = self._mutate_register(inst)
                    mutations_applied['register'] += 1

                elif mutation_type == 'immediate':
                    # Change immediate value
                    inst = self._mutate_immediate(inst)
                    mutations_applied['immediate'] += 1

                elif mutation_type == 'insert' and i > 0:
                    # Insert a random instruction before this one
                    new_inst = self._generate_random_instruction()
                    mutated.append(new_inst)
                    mutations_applied['insert'] += 1

                elif mutation_type == 'delete':
                    # Skip this instruction
                    mutations_applied['delete'] += 1
                    continue

            mutated.append(inst)

        # Record mutation in history
        self._mutation_history.append({
            'input_size': len(program),
            'output_size': len(mutated) * 4,
            'mutation_rate': mutation_rate,
            'mutations_applied': mutations_applied,
            'instruction_count': len(mutated),
        })

        total_mutations = sum(mutations_applied.values())
        logger.info(f"Applied {total_mutations} mutations to program")

        return self.assemble(mutated)

    def _mutate_opcode(self, inst: Instruction) -> Instruction:
        """Mutate the opcode to a related one."""
        # Map opcodes to related alternatives
        opcode_alternatives = {
            Opcode.EMBED: [Opcode.EMBED],  # EMBED is unique
            Opcode.ATTEND: [Opcode.ATTEND, Opcode.PROJECT],  # Can swap attention/FFN
            Opcode.PROJECT: [Opcode.PROJECT, Opcode.ATTEND],
            Opcode.SAMPLE: [Opcode.SAMPLE],  # SAMPLE is unique
            Opcode.LAYER: [Opcode.LAYER],
            Opcode.KV_APPEND: [Opcode.KV_APPEND],
            Opcode.THOUGHT_PULSE: [Opcode.THOUGHT_PULSE],
        }

        alternatives = opcode_alternatives.get(inst.opcode, [inst.opcode])

        if len(alternatives) > 1 and random.random() < 0.5:
            new_opcode = random.choice(alternatives)
            return Instruction(
                opcode=new_opcode,
                rd=inst.rd,
                rs=inst.rs,
                imm=inst.imm,
            )

        return inst

    def _mutate_register(self, inst: Instruction) -> Instruction:
        """Mutate register assignments."""
        # Randomly change one of the registers
        choice = random.choice(['rd', 'rs', 'both'])

        new_rd = inst.rd
        new_rs = inst.rs

        if choice in ('rd', 'both'):
            new_rd = random.randint(0, 7)

        if choice in ('rs', 'both'):
            new_rs = random.randint(0, 7)

        return Instruction(
            opcode=inst.opcode,
            rd=new_rd,
            rs=new_rs,
            imm=inst.imm,
        )

    def _mutate_immediate(self, inst: Instruction) -> Instruction:
        """Mutate the immediate value."""
        if inst.opcode == Opcode.LAYER:
            # For LAYER, mutate layer index (typically 0-7)
            new_imm = random.randint(0, 7)
        elif inst.opcode == Opcode.KV_APPEND:
            # For KV_APPEND, toggle K/V type
            new_imm = 1 - inst.imm
        else:
            # For others, add small random offset
            new_imm = (inst.imm + random.randint(-10, 10)) & 0xFF

        return Instruction(
            opcode=inst.opcode,
            rd=inst.rd,
            rs=inst.rs,
            imm=new_imm,
        )

    def _generate_random_instruction(self) -> Instruction:
        """Generate a random instruction."""
        opcode = random.choice(list(Opcode))

        if opcode == Opcode.LAYER:
            return Instruction(opcode=opcode, imm=random.randint(0, 7))
        else:
            return Instruction(
                opcode=opcode,
                rd=random.randint(0, 7),
                rs=random.randint(0, 7),
                imm=random.randint(0, 255),
            )

    def analyze(self, program: bytes) -> dict:
        """
        Analyze a GeoASM program structure.

        Args:
            program: Raw program bytes

        Returns:
            Analysis results
        """
        instructions = self.disassemble(program)

        opcode_counts = {}
        register_usage = dict.fromkeys(range(8), 0)

        for inst in instructions:
            name = inst.opcode.name
            opcode_counts[name] = opcode_counts.get(name, 0) + 1
            register_usage[inst.rd] += 1
            if inst.rs != inst.rd:
                register_usage[inst.rs] += 1

        return {
            'instruction_count': len(instructions),
            'size_bytes': len(program),
            'opcode_distribution': opcode_counts,
            'register_usage': register_usage,
            'has_embedding': 'EMBED' in opcode_counts,
            'has_attention': 'ATTEND' in opcode_counts,
            'has_projection': 'PROJECT' in opcode_counts,
            'has_sampling': 'SAMPLE' in opcode_counts,
            'layer_count': opcode_counts.get('LAYER', 0),
        }

    def validate(self, program: bytes) -> tuple[bool, list[str]]:
        """
        Validate a GeoASM program.

        Args:
            program: Raw program bytes

        Returns:
            Tuple of (is_valid, list_of_errors)
        """
        errors = []

        # Check program size is multiple of 4
        if len(program) % 4 != 0:
            errors.append(f"Program size ({len(program)}) is not a multiple of 4 bytes")

        instructions = self.disassemble(program)

        if not instructions:
            errors.append("Program is empty")
            return False, errors

        # Check for required instructions
        opcode_names = {inst.opcode.name for inst in instructions}

        if 'EMBED' not in opcode_names:
            errors.append("Missing EMBED instruction (required for token embedding)")

        if 'SAMPLE' not in opcode_names:
            errors.append("Missing SAMPLE instruction (required for token generation)")

        # Check for balanced register usage
        analysis = self.analyze(program)
        register_usage = analysis['register_usage']

        # Warn if some registers are never used
        unused = [r for r, count in register_usage.items() if count == 0]
        if len(unused) > 4:
            errors.append(f"Many registers unused: {unused}")

        # Check for valid opcode values
        for i, inst in enumerate(instructions):
            try:
                Opcode(inst.opcode.value)
            except ValueError:
                errors.append(f"Invalid opcode 0x{inst.opcode.value:02X} at instruction {i}")

        return len(errors) == 0, errors

    def crossover(self, program1: bytes, program2: bytes) -> bytes:
        """
        Perform crossover between two programs (genetic algorithm).

        Args:
            program1: First parent program
            program2: Second parent program

        Returns:
            Child program combining elements from both parents
        """
        inst1 = self.disassemble(program1)
        inst2 = self.disassemble(program2)

        # Single-point crossover
        if not inst1 or not inst2:
            return program1 if inst1 else program2

        # Choose crossover point
        point1 = random.randint(1, len(inst1) - 1) if len(inst1) > 1 else 0
        point2 = random.randint(1, len(inst2) - 1) if len(inst2) > 1 else 0

        # Combine
        child = inst1[:point1] + inst2[point2:]

        return self.assemble(child)

    def get_mutation_history(self) -> list[dict]:
        """Get history of mutations applied."""
        return list(self._mutation_history)

    def clear_history(self) -> None:
        """Clear mutation history."""
        self._mutation_history.clear()

    def to_text(self, program: bytes) -> str:
        """
        Convert program to human-readable assembly text.

        Args:
            program: Raw program bytes

        Returns:
            Assembly text
        """
        instructions = self.disassemble(program)
        lines = []

        for inst in instructions:
            if inst.opcode == Opcode.LAYER:
                lines.append(f"LAYER #{inst.imm}")
            elif inst.opcode == Opcode.KV_APPEND:
                kv_type = "K" if inst.imm == 0 else "V"
                lines.append(f"KV_APPEND R{inst.rs}, #{inst.imm} ({kv_type})")
            elif inst.opcode == Opcode.THOUGHT_PULSE:
                lines.append(f"THOUGHT_PULSE R{inst.rs}")
            else:
                lines.append(f"{inst.opcode.name} R{inst.rs}, R{inst.rd}")

        return '\n'.join(lines)

    def from_text(self, text: str) -> bytes:
        """
        Parse assembly text into program bytes.

        Args:
            text: Assembly text

        Returns:
            Raw program bytes
        """
        instructions = []

        for line in text.strip().split('\n'):
            line = line.strip()
            if not line or line.startswith('//') or line.startswith('#'):
                continue

            inst = self._parse_instruction(line)
            if inst:
                instructions.append(inst)

        return self.assemble(instructions)

    def _parse_instruction(self, line: str) -> Instruction | None:
        """Parse a single assembly line."""
        # Remove comments
        if ';' in line:
            line = line[:line.index(';')]
        line = line.strip()

        if not line:
            return None

        parts = line.split()
        if not parts:
            return None

        opcode_str = parts[0].upper()

        try:
            opcode = Opcode[opcode_str]
        except KeyError:
            return None

        if opcode == Opcode.LAYER:
            # LAYER #N
            imm = int(parts[1].replace('#', '')) if len(parts) > 1 else 0
            return Instruction(opcode=opcode, imm=imm)

        elif opcode == Opcode.THOUGHT_PULSE:
            # THOUGHT_PULSE Rs
            rs = int(parts[1].replace('R', '').replace('r', '')) if len(parts) > 1 else 0
            return Instruction(opcode=opcode, rs=rs)

        elif opcode == Opcode.KV_APPEND:
            # KV_APPEND Rs, #imm
            rs = 0
            imm = 0
            if len(parts) > 1:
                rs = int(parts[1].replace('R', '').replace('r', '').replace(',', ''))
            if len(parts) > 2:
                imm = int(parts[2].replace('#', '').replace(',', ''))
            return Instruction(opcode=opcode, rs=rs, imm=imm)

        else:
            # OPCODE Rs, Rd
            rs = 0
            rd = 0
            if len(parts) > 1:
                rs = int(parts[1].replace('R', '').replace('r', '').replace(',', ''))
            if len(parts) > 2:
                rd = int(parts[2].replace('R', '').replace('r', ''))
            return Instruction(opcode=opcode, rs=rs, rd=rd)

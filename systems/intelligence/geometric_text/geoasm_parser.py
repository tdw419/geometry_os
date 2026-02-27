"""
GeoASM Parser

Parses Geometric Assembly source code into instruction lists.
Supports 12 symbols mapped to WebAssembly-style opcodes.
"""

from dataclasses import dataclass
from typing import List, Tuple

from systems.intelligence.geometric_text.geoasm_opcodes import SYMBOL_TO_OPCODE, get_opcode_name


@dataclass
class GeoASMInstruction:
    """A single GeoASM instruction with opcode, operand, and source location."""
    opcode: int      # The numeric opcode (e.g., 0x41 for i32.const)
    operand: int     # The operand value (0-65535), 0 if no operand
    char: str        # The source symbol character (e.g., '$')
    line: int        # 1-based line number
    col: int         # 1-based column number


@dataclass
class ParseError:
    """A parse error with message and source location."""
    message: str     # Error description
    line: int        # 1-based line number
    col: int         # 1-based column number

    def __str__(self) -> str:
        """Return readable error message with location."""
        return f"Parse error at line {self.line}, col {self.col}: {self.message}"


class GeoASMParser:
    """
    Parser for GeoASM (Geometric Assembly) source code.

    Grammar:
        script    = (line | comment)*
        line      = instruction+
        instruction = symbol [operand]
        symbol    = '$' | '+' | '-' | '*' | '<' | '>' | '!' | '?' | '@' | '~' | '.' | '#'
        operand   = integer (0-65535)
        comment   = '#' text '\\n'

    Example:
        parser = GeoASMParser()
        instructions, errors = parser.parse("$ 5 $ 3 +")
        # instructions[0] -> opcode=0x41, operand=5, char='$'
        # instructions[1] -> opcode=0x41, operand=3, char='$'
        # instructions[2] -> opcode=0x6A, operand=0, char='+'
    """

    # Valid symbols for GeoASM
    VALID_SYMBOLS = set(SYMBOL_TO_OPCODE.keys())

    def __init__(self):
        """Initialize the parser."""
        pass

    def parse(self, source: str) -> Tuple[List[GeoASMInstruction], List[ParseError]]:
        """
        Parse GeoASM source code into instructions.

        Args:
            source: GeoASM source code string

        Returns:
            Tuple of (instructions list, errors list)
        """
        instructions: List[GeoASMInstruction] = []
        errors: List[ParseError] = []

        lines = source.split('\n')

        for line_num, line in enumerate(lines, start=1):
            # Skip empty lines
            if not line.strip():
                continue

            # Skip comment lines (lines starting with #)
            stripped = line.lstrip()
            if stripped.startswith('#'):
                continue

            # Parse tokens in the line
            col = 1
            i = 0
            while i < len(line):
                char = line[i]

                # Skip whitespace
                if char in ' \t':
                    i += 1
                    col += 1
                    continue

                # Skip inline comments
                if char == '#':
                    break

                # Check if it's a valid symbol
                if char in self.VALID_SYMBOLS:
                    opcode = SYMBOL_TO_OPCODE[char]
                    operand = 0
                    symbol_col = col

                    # Look ahead for operand
                    j = i + 1
                    operand_start = None
                    while j < len(line) and line[j] in ' \t':
                        j += 1

                    # Check if there's a number following
                    if j < len(line) and line[j].isdigit():
                        operand_start = j
                        while j < len(line) and line[j].isdigit():
                            j += 1
                        operand_str = line[operand_start:j]
                        try:
                            operand = int(operand_str)
                            if operand < 0 or operand > 65535:
                                errors.append(ParseError(
                                    message=f"Operand {operand} out of range (0-65535)",
                                    line=line_num,
                                    col=operand_start + 1
                                ))
                        except ValueError:
                            errors.append(ParseError(
                                message=f"Invalid operand: {operand_str}",
                                line=line_num,
                                col=operand_start + 1
                            ))

                    # Create instruction
                    instructions.append(GeoASMInstruction(
                        opcode=opcode,
                        operand=operand,
                        char=char,
                        line=line_num,
                        col=symbol_col
                    ))

                    # Update position
                    col += (j - i)
                    i = j
                else:
                    # Unknown character - report error
                    errors.append(ParseError(
                        message=f"Unknown symbol: '{char}'",
                        line=line_num,
                        col=col
                    ))
                    i += 1
                    col += 1

        return instructions, errors

    def parse_file(self, path: str) -> Tuple[List[GeoASMInstruction], List[ParseError]]:
        """
        Parse GeoASM source from a file.

        Args:
            path: Path to the .geo file

        Returns:
            Tuple of (instructions list, errors list)
        """
        with open(path, 'r') as f:
            source = f.read()
        return self.parse(source)


def disassemble(instructions: List[GeoASMInstruction]) -> str:
    """
    Convert a list of GeoASM instructions back to readable GeoASM text.

    Args:
        instructions: List of GeoASMInstruction objects

    Returns:
        Readable GeoASM source text with opcode name comments

    Example:
        >>> parser = GeoASMParser()
        >>> instructions, _ = parser.parse("$ 5 $ 3 +")
        >>> print(disassemble(instructions))
        $ 5  ; i32.const
        $ 3  ; i32.const
        +    ; i32.add
    """
    lines = []
    for instr in instructions:
        # Get the opcode name for the comment
        opcode_name = get_opcode_name(instr.opcode)

        # Format: symbol [operand]  ; opcode_name
        if instr.operand != 0:
            line = f"{instr.char} {instr.operand}  ; {opcode_name}"
        else:
            line = f"{instr.char}    ; {opcode_name}"

        lines.append(line)

    return '\n'.join(lines)

"""
PixelRTS Assembler Linter

Validates assembly source for common errors:
- Undefined labels
- Invalid registers
- Unused variables
- Dead code
"""
from dataclasses import dataclass
from typing import List
import re


@dataclass
class LinterError:
    """Represents a lint error or warning"""
    line: int
    col: int
    message: str
    severity: str  # 'error' or 'warning'

    def __str__(self):
        return f"{self.line}:{self.col} {self.severity}: {self.message}"


def lint_source(source: str) -> List[LinterError]:
    """
    Lint assembly source code

    Args:
        source: Assembly source code

    Returns:
        List of LinterError objects (empty if no issues)
    """
    errors = []

    # Track state
    labels_defined = set()
    labels_used = set()
    registers_read = set()  # Registers used as source operands
    registers_written = set()  # Registers used as destination operands

    # Instructions that read AND write the destination register
    read_modify_write = {'ADD', 'SUB', 'MUL', 'DIV', 'AND', 'OR', 'XOR', 'SHL', 'SHR'}

    lines = source.split('\n')

    for line_num, line in enumerate(lines, start=1):
        # Strip comments
        line = line.split(';')[0].strip()
        if not line:
            continue

        # Check for label definition
        if line.endswith(':'):
            label_name = line[:-1].strip()
            labels_defined.add(label_name)
            continue

        # Parse instruction
        parts = line.split()
        if not parts:
            continue

        mnemonic = parts[0].upper()

        # Track destination register (first operand after mnemonic)
        dest_reg = None
        if len(parts) >= 2:
            dest_match = re.match(r'R(\d+)', parts[1].upper())
            if dest_match:
                dest_reg = int(dest_match.group(1))
                if dest_reg > 255:
                    errors.append(LinterError(
                        line_num, 0,
                        f"Register number too large: R{dest_reg} (max R255)",
                        'error'
                    ))
                registers_written.add(dest_reg)

                # For read-modify-write instructions, destination is also read
                if mnemonic in read_modify_write:
                    registers_read.add(dest_reg)

        # Track source registers (second operand onwards)
        if len(parts) >= 3:
            # Second operand is a source (could be register or immediate)
            src_match = re.match(r'R(\d+)', parts[2].upper())
            if src_match:
                reg_num = int(src_match.group(1))
                if reg_num > 255:
                    errors.append(LinterError(
                        line_num, 0,
                        f"Register number too large: R{reg_num} (max R255)",
                        'error'
                    ))
                registers_read.add(reg_num)

        # Single operand instructions (RET uses register as source)
        if mnemonic == 'RET' and len(parts) >= 2:
            src_match = re.match(r'R(\d+)', parts[1].upper())
            if src_match:
                reg_num = int(src_match.group(1))
                if reg_num > 255:
                    errors.append(LinterError(
                        line_num, 0,
                        f"Register number too large: R{reg_num} (max R255)",
                        'error'
                    ))
                registers_read.add(reg_num)

        # Track label usage (jumps)
        if mnemonic in ['JMP', 'JZ', 'JNZ', 'CALL']:
            if len(parts) >= 2:
                label_ref = parts[1]
                # Skip if it's a register
                if not re.match(r'R\d+', label_ref.upper()):
                    labels_used.add(label_ref)

    # Check for undefined labels
    for label in labels_used:
        if label not in labels_defined:
            errors.append(LinterError(
                0, 0,
                f"Undefined label: {label}",
                'error'
            ))

    # Check for unused registers (written but never read as source)
    for reg in registers_written - registers_read:
        errors.append(LinterError(
            0, 0,
            f"Unused register: R{reg} (written but never read)",
            'warning'
        ))

    return errors


def print_errors(errors: List[LinterError]):
    """Print lint errors with colors"""
    from vasm import print_error, print_warning

    for error in errors:
        if error.severity == 'error':
            print_error(str(error))
        else:
            print_warning(str(error))


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python linter.py <file.vasm>")
        sys.exit(1)

    with open(sys.argv[1], 'r') as f:
        source = f.read()

    errors = lint_source(source)

    if errors:
        print_errors(errors)
        error_count = sum(1 for e in errors if e.severity == 'error')
        warning_count = sum(1 for e in errors if e.severity == 'warning')
        print()
        print(f"Found {error_count} error(s), {warning_count} warning(s)")
        sys.exit(1 if error_count > 0 else 0)
    else:
        print("No issues found")
        sys.exit(0)

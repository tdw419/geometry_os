# PixelISA v1.0 Specification

## Instruction Format

Each instruction is encoded as a single RGBA pixel:

| Channel | Bits | Purpose |
|---------|------|---------|
| Red (R) | 8    | Opcode |
| Green (G) | 8  | Destination Register or Operand 1 |
| Blue (B) | 8   | Source Register or Operand 2 |
| Alpha (A) | 8  | Immediate Value or Flags |

## Opcodes

| Opcode | Mnemonic | Encoding | Description |
|--------|----------|----------|-------------|
| 0x00   | NOP      | R=0x00    | No operation |
| 0x01   | LOAD     | R=0x01, G=dest, A=imm | Load immediate: Reg[G] = A |
| 0x02   | MOV      | R=0x02, G=dest, B=src | Move register: Reg[G] = Reg[B] |
| 0x10   | ADD      | R=0x10, G=dest, B=src | Add: Reg[G] += Reg[B] |
| 0x11   | SUB      | R=0x11, G=dest, B=src | Subtract: Reg[G] -= Reg[B] |
| 0x12   | MUL      | R=0x12, G=dest, B=src | Multiply: Reg[G] *= Reg[B] |
| 0x13   | DIV      | R=0x13, G=dest, B=src | Divide: Reg[G] /= Reg[B] |
| 0x20   | JMP      | R=0x20, A=addr | Jump to address |
| 0x21   | JZ       | R=0x21, G=reg, A=addr | Jump if zero: if Reg[G]==0 goto A |
| 0x22   | JNZ      | R=0x22, G=reg, A=addr | Jump if not zero |
| 0x30   | CALL     | R=0x30, A=addr | Call subroutine |
| 0x31   | RET      | R=0x31, G=reg | Return: result in Reg[G] |
| 0x40   | TEXTURE  | R=0x40, G=dest, B=slot | Load from texture slot |
| 0x41   | SAMPLE   | R=0x41, G=dest, A=coord | Sample texture at coordinate |

## Visual ABI (Function Linking)

The top-left 64×64 region of every .rts.png encodes the public interface:

- **Row 0**: Function name hashes (CRC32) → Entry point addresses
- **Row 1-63**: Reserved for future metadata (type signatures, version, etc.)

Function entry points are encoded as:
- Red: Function hash byte 0
- Green: Function hash byte 1
- Blue: Entry address high byte
- Alpha: Entry address low byte

## Semantic Coloring (Code Mode)

When assembling with `--mode code`, opcodes are colored by category:

- **Control Flow** (JMP, JZ, CALL, RET): Red = 255, Cool G/B
- **Arithmetic** (ADD, SUB, MUL, DIV): Red = 128-200
- **Memory** (LOAD, MOV, TEXTURE): Red = 50-100
- **Data** (NOP): Red = 0

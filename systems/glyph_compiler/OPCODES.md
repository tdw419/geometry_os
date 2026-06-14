# systems/glyph_compiler/OPCODES.md

# Glyph Opcode Reference

The canonical opcode definitions are in:
`apps/autoresearch/champion_shader.wgsl`

## Opcode Range: 200-227

| Opcode | Name | Description |
|--------|------|-------------|
| 200 | ADD_M | memory[dst] = p1 + p2 |
| 201 | SUB_M | memory[dst] = p1 - p2 |
| 202 | MUL_M | memory[dst] = p1 * p2 |
| 203 | DIV_M | memory[dst] = p1 / p2 (if p2 != 0) |
| 204 | LD | memory[dst] = memory[p1] |
| 205 | ST | memory[p1] = p2 |
| 206 | MOV | memory[dst] = p1 |
| 207 | CLR | memory[dst] = 0.0 |
| 208 | JMP | pc = p1 |
| 209 | JZ | if memory[dst] == 0 { pc = p1 } |
| 210 | CALL | stack[sp++] = pc; pc = p1 |
| 211 | RET | pc = stack[--sp] |
| 212 | HALT | halted = 1 |
| 215 | DRAW | Blit glyph from atlas to screen |
| 216 | ADD_MEM | memory[dst] = memory[p1] + memory[p2] |
| 217 | SUB_MEM | memory[dst] = memory[p1] - memory[p2] |
| 218 | INT_DISPATCH | Hit testing for UI events |
| 220 | BRANCH_PROB | Probabilistic branching |
| 221 | CONFIDENCE_MARK | Semantic metadata |
| 222 | ALTERNATE_PATH | Fallback mechanism |
| 223 | ATTENTION_FOCUS | Sparse optimization |
| 224 | GLYPH_MUTATE | Self-modification |
| 225 | SPATIAL_SPAWN | Cluster generation |
| 227 | LOAD_EMBEDDING | Neural bridge |

## Reserved: 213, 214, 226

Available for future AI-designed opcodes.

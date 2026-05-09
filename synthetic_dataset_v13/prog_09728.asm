; DESCRIPTION: Draws a magenta line from (114, 166) to (448, 242).
; PLAN: r0=114(x1), r1=166(y1), r2=448(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 166
LDI r2, 448
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

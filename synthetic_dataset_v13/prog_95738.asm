; DESCRIPTION: Draws a magenta line from (226, 107) to (379, 65).
; PLAN: r0=226(x1), r1=107(y1), r2=379(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 107
LDI r2, 379
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

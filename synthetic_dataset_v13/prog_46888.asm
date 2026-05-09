; DESCRIPTION: Draws a magenta line from (498, 251) to (457, 157).
; PLAN: r0=498(x1), r1=251(y1), r2=457(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 251
LDI r2, 457
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

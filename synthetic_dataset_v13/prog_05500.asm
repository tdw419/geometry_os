; DESCRIPTION: Renders a magenta line between points (376, 178) and (52, 158).
; PLAN: r0=376(x1), r1=178(y1), r2=52(x2), r3=158(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 178
LDI r2, 52
LDI r3, 158
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

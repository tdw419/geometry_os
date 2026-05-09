; DESCRIPTION: Draws a magenta line from (318, 24) to (0, 30).
; PLAN: r0=318(x1), r1=24(y1), r2=0(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 24
LDI r2, 0
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

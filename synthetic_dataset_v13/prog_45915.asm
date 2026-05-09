; DESCRIPTION: Draws a blue line from (194, 156) to (376, 176).
; PLAN: r0=194(x1), r1=156(y1), r2=376(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 156
LDI r2, 376
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

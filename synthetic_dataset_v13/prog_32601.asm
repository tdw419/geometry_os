; DESCRIPTION: Draws a purple line from (376, 137) to (270, 136).
; PLAN: r0=376(x1), r1=137(y1), r2=270(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 137
LDI r2, 270
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

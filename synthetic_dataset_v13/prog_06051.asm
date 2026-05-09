; DESCRIPTION: Draws a blue line from (457, 179) to (318, 11).
; PLAN: r0=457(x1), r1=179(y1), r2=318(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 179
LDI r2, 318
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

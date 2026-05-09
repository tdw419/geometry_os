; DESCRIPTION: Draws a yellow line from (318, 251) to (227, 148).
; PLAN: r0=318(x1), r1=251(y1), r2=227(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 251
LDI r2, 227
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

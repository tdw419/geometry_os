; DESCRIPTION: Draws a yellow line from (19, 75) to (201, 232).
; PLAN: r0=19(x1), r1=75(y1), r2=201(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 75
LDI r2, 201
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

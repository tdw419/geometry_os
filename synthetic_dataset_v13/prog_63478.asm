; DESCRIPTION: Draws a yellow line from (201, 144) to (30, 4).
; PLAN: r0=201(x1), r1=144(y1), r2=30(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 144
LDI r2, 30
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

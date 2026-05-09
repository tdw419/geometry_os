; DESCRIPTION: Places a yellow line segment connecting (155, 15) to (297, 74).
; PLAN: r0=155(x1), r1=15(y1), r2=297(x2), r3=74(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 15
LDI r2, 297
LDI r3, 74
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

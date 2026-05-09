; DESCRIPTION: Places a yellow line segment connecting (204, 118) to (297, 31).
; PLAN: r0=204(x1), r1=118(y1), r2=297(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 118
LDI r2, 297
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

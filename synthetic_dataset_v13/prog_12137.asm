; DESCRIPTION: Places a yellow line segment connecting (297, 251) to (504, 24).
; PLAN: r0=297(x1), r1=251(y1), r2=504(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 251
LDI r2, 504
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

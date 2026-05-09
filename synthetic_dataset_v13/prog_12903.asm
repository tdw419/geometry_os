; DESCRIPTION: Places a white line segment connecting (158, 15) to (163, 23).
; PLAN: r0=158(x1), r1=15(y1), r2=163(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 15
LDI r2, 163
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

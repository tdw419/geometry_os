; DESCRIPTION: Places a white line segment connecting (158, 110) to (444, 216).
; PLAN: r0=158(x1), r1=110(y1), r2=444(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 110
LDI r2, 444
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

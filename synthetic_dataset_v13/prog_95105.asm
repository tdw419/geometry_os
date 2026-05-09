; DESCRIPTION: Places a white line segment connecting (390, 110) to (508, 89).
; PLAN: r0=390(x1), r1=110(y1), r2=508(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 110
LDI r2, 508
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

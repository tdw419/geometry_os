; DESCRIPTION: Places a white line segment connecting (55, 170) to (374, 52).
; PLAN: r0=55(x1), r1=170(y1), r2=374(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 170
LDI r2, 374
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

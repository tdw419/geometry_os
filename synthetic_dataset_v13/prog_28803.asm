; DESCRIPTION: Places a orange line segment connecting (163, 170) to (169, 7).
; PLAN: r0=163(x1), r1=170(y1), r2=169(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 170
LDI r2, 169
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

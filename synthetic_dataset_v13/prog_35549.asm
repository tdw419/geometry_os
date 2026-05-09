; DESCRIPTION: Places a orange line segment connecting (448, 170) to (283, 187).
; PLAN: r0=448(x1), r1=170(y1), r2=283(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 170
LDI r2, 283
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

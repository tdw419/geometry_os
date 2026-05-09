; DESCRIPTION: Places a orange line segment connecting (33, 170) to (288, 77).
; PLAN: r0=33(x1), r1=170(y1), r2=288(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 170
LDI r2, 288
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

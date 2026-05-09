; DESCRIPTION: Places a orange line segment connecting (451, 54) to (99, 187).
; PLAN: r0=451(x1), r1=54(y1), r2=99(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 54
LDI r2, 99
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (294, 84) to (312, 23).
; PLAN: r0=294(x1), r1=84(y1), r2=312(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 84
LDI r2, 312
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

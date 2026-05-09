; DESCRIPTION: Places a orange line segment connecting (430, 144) to (447, 62).
; PLAN: r0=430(x1), r1=144(y1), r2=447(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 144
LDI r2, 447
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

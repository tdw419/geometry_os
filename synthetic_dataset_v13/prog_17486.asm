; DESCRIPTION: Places a orange line segment connecting (85, 123) to (431, 32).
; PLAN: r0=85(x1), r1=123(y1), r2=431(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 123
LDI r2, 431
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

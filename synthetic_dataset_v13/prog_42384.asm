; DESCRIPTION: Places a orange line segment connecting (222, 123) to (256, 62).
; PLAN: r0=222(x1), r1=123(y1), r2=256(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 123
LDI r2, 256
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

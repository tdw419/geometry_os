; DESCRIPTION: Places a orange line segment connecting (396, 224) to (20, 31).
; PLAN: r0=396(x1), r1=224(y1), r2=20(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 224
LDI r2, 20
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

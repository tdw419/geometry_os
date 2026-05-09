; DESCRIPTION: Places a orange line segment connecting (62, 224) to (472, 108).
; PLAN: r0=62(x1), r1=224(y1), r2=472(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 224
LDI r2, 472
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

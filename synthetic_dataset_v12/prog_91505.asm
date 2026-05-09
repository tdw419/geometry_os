; DESCRIPTION: Places a orange line segment connecting (395, 2) to (359, 232).
; PLAN: r0=395(x1), r1=2(y1), r2=359(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 2
LDI r2, 359
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

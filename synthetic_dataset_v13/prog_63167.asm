; DESCRIPTION: Places a orange line segment connecting (6, 3) to (349, 62).
; PLAN: r0=6(x1), r1=3(y1), r2=349(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 3
LDI r2, 349
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (483, 40) to (376, 244).
; PLAN: r0=483(x1), r1=40(y1), r2=376(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 40
LDI r2, 376
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

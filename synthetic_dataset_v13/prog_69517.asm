; DESCRIPTION: Places a orange line segment connecting (79, 76) to (314, 244).
; PLAN: r0=79(x1), r1=76(y1), r2=314(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 76
LDI r2, 314
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

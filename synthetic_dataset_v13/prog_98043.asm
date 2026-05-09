; DESCRIPTION: Places a orange line segment connecting (370, 181) to (477, 109).
; PLAN: r0=370(x1), r1=181(y1), r2=477(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 181
LDI r2, 477
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

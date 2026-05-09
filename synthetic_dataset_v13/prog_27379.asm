; DESCRIPTION: Places a orange line segment connecting (134, 89) to (395, 157).
; PLAN: r0=134(x1), r1=89(y1), r2=395(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 89
LDI r2, 395
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

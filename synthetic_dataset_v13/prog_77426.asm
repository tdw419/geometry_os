; DESCRIPTION: Places a orange line segment connecting (314, 106) to (26, 2).
; PLAN: r0=314(x1), r1=106(y1), r2=26(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 106
LDI r2, 26
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

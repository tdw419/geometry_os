; DESCRIPTION: Places a orange line segment connecting (47, 34) to (343, 68).
; PLAN: r0=47(x1), r1=34(y1), r2=343(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 34
LDI r2, 343
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

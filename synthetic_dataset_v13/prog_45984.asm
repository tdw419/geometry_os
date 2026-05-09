; DESCRIPTION: Places a orange line segment connecting (25, 129) to (343, 118).
; PLAN: r0=25(x1), r1=129(y1), r2=343(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 129
LDI r2, 343
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

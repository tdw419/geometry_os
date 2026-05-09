; DESCRIPTION: Places a orange line segment connecting (471, 106) to (118, 122).
; PLAN: r0=471(x1), r1=106(y1), r2=118(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 106
LDI r2, 118
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

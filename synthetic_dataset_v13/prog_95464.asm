; DESCRIPTION: Places a orange line segment connecting (484, 165) to (167, 140).
; PLAN: r0=484(x1), r1=165(y1), r2=167(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 165
LDI r2, 167
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

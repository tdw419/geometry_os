; DESCRIPTION: Places a orange line segment connecting (167, 179) to (74, 241).
; PLAN: r0=167(x1), r1=179(y1), r2=74(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 179
LDI r2, 74
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

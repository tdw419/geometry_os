; DESCRIPTION: Draws a orange line from (49, 157) to (311, 129).
; PLAN: r0=49(x1), r1=157(y1), r2=311(x2), r3=129(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 157
LDI r2, 311
LDI r3, 129
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

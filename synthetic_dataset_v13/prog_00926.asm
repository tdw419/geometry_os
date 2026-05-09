; DESCRIPTION: Places a orange line segment connecting (161, 118) to (188, 161).
; PLAN: r0=161(x1), r1=118(y1), r2=188(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 118
LDI r2, 188
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

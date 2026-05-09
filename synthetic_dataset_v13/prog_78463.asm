; DESCRIPTION: Places a orange line segment connecting (370, 227) to (462, 74).
; PLAN: r0=370(x1), r1=227(y1), r2=462(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 227
LDI r2, 462
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (54, 184) to (30, 162).
; PLAN: r0=54(x1), r1=184(y1), r2=30(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 184
LDI r2, 30
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

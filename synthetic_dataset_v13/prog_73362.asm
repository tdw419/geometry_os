; DESCRIPTION: Places a orange line segment connecting (200, 158) to (157, 71).
; PLAN: r0=200(x1), r1=158(y1), r2=157(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 158
LDI r2, 157
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (262, 22) to (3, 34).
; PLAN: r0=262(x1), r1=22(y1), r2=3(x2), r3=34(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 22
LDI r2, 3
LDI r3, 34
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

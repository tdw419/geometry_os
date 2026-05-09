; DESCRIPTION: Places a orange line segment connecting (301, 60) to (169, 88).
; PLAN: r0=301(x1), r1=60(y1), r2=169(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 60
LDI r2, 169
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

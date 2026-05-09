; DESCRIPTION: Places a orange line segment connecting (112, 185) to (34, 22).
; PLAN: r0=112(x1), r1=185(y1), r2=34(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 185
LDI r2, 34
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

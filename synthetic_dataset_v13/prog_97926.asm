; DESCRIPTION: Places a orange line segment connecting (438, 153) to (414, 88).
; PLAN: r0=438(x1), r1=153(y1), r2=414(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 153
LDI r2, 414
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

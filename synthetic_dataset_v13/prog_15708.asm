; DESCRIPTION: Places a orange line segment connecting (353, 137) to (133, 11).
; PLAN: r0=353(x1), r1=137(y1), r2=133(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 137
LDI r2, 133
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

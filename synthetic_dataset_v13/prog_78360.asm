; DESCRIPTION: Places a orange line segment connecting (133, 158) to (438, 54).
; PLAN: r0=133(x1), r1=158(y1), r2=438(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 158
LDI r2, 438
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

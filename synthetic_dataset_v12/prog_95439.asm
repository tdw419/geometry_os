; DESCRIPTION: Places a yellow line segment connecting (438, 181) to (85, 34).
; PLAN: r0=438(x1), r1=181(y1), r2=85(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 181
LDI r2, 85
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

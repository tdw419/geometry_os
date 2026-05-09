; DESCRIPTION: Places a orange line segment connecting (438, 198) to (289, 68).
; PLAN: r0=438(x1), r1=198(y1), r2=289(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 198
LDI r2, 289
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (438, 199) to (132, 187).
; PLAN: r0=438(x1), r1=199(y1), r2=132(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 199
LDI r2, 132
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

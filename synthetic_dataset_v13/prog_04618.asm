; DESCRIPTION: Places a black line segment connecting (438, 98) to (427, 109).
; PLAN: r0=438(x1), r1=98(y1), r2=427(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 98
LDI r2, 427
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

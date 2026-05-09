; DESCRIPTION: Places a black line segment connecting (438, 246) to (18, 137).
; PLAN: r0=438(x1), r1=246(y1), r2=18(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 246
LDI r2, 18
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

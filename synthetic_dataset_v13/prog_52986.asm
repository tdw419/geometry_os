; DESCRIPTION: Places a black line segment connecting (427, 244) to (391, 133).
; PLAN: r0=427(x1), r1=244(y1), r2=391(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 244
LDI r2, 391
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

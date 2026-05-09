; DESCRIPTION: Places a black line segment connecting (246, 172) to (423, 147).
; PLAN: r0=246(x1), r1=172(y1), r2=423(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 172
LDI r2, 423
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (458, 251) to (147, 195).
; PLAN: r0=458(x1), r1=251(y1), r2=147(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 251
LDI r2, 147
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

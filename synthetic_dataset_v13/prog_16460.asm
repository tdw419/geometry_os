; DESCRIPTION: Places a black line segment connecting (325, 92) to (87, 232).
; PLAN: r0=325(x1), r1=92(y1), r2=87(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 92
LDI r2, 87
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

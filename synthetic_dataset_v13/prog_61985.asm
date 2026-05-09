; DESCRIPTION: Places a black line segment connecting (419, 21) to (325, 116).
; PLAN: r0=419(x1), r1=21(y1), r2=325(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 21
LDI r2, 325
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

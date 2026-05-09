; DESCRIPTION: Places a yellow line segment connecting (325, 184) to (419, 67).
; PLAN: r0=325(x1), r1=184(y1), r2=419(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 184
LDI r2, 419
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

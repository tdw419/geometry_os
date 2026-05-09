; DESCRIPTION: Places a purple line segment connecting (419, 92) to (256, 100).
; PLAN: r0=419(x1), r1=92(y1), r2=256(x2), r3=100(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 92
LDI r2, 256
LDI r3, 100
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

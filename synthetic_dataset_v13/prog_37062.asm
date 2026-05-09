; DESCRIPTION: Places a purple line segment connecting (419, 31) to (40, 73).
; PLAN: r0=419(x1), r1=31(y1), r2=40(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 31
LDI r2, 40
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

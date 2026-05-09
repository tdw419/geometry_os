; DESCRIPTION: Places a purple line segment connecting (419, 38) to (325, 205).
; PLAN: r0=419(x1), r1=38(y1), r2=325(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 38
LDI r2, 325
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (335, 189) to (419, 104).
; PLAN: r0=335(x1), r1=189(y1), r2=419(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 189
LDI r2, 419
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (419, 199) and (201, 90).
; PLAN: r0=419(x1), r1=199(y1), r2=201(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 199
LDI r2, 201
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

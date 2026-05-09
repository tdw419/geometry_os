; DESCRIPTION: Renders a purple line between points (419, 109) and (83, 53).
; PLAN: r0=419(x1), r1=109(y1), r2=83(x2), r3=53(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 109
LDI r2, 83
LDI r3, 53
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

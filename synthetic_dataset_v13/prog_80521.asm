; DESCRIPTION: Renders a purple line between points (7, 122) and (419, 24).
; PLAN: r0=7(x1), r1=122(y1), r2=419(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 122
LDI r2, 419
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (142, 75) and (52, 227).
; PLAN: r0=142(x1), r1=75(y1), r2=52(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 75
LDI r2, 52
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

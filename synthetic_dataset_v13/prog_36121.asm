; DESCRIPTION: Renders a purple line between points (148, 218) and (293, 118).
; PLAN: r0=148(x1), r1=218(y1), r2=293(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 218
LDI r2, 293
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

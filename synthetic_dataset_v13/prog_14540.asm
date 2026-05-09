; DESCRIPTION: Renders a purple line between points (29, 179) and (457, 175).
; PLAN: r0=29(x1), r1=179(y1), r2=457(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 179
LDI r2, 457
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

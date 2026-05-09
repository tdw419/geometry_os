; DESCRIPTION: Renders a purple line between points (62, 210) and (124, 105).
; PLAN: r0=62(x1), r1=210(y1), r2=124(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 210
LDI r2, 124
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

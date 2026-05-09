; DESCRIPTION: Renders a purple line between points (200, 106) and (163, 138).
; PLAN: r0=200(x1), r1=106(y1), r2=163(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 106
LDI r2, 163
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

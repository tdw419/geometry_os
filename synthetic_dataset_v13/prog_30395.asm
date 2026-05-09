; DESCRIPTION: Renders a purple line between points (163, 162) and (409, 47).
; PLAN: r0=163(x1), r1=162(y1), r2=409(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 162
LDI r2, 409
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

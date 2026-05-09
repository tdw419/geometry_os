; DESCRIPTION: Renders a purple line between points (377, 55) and (112, 97).
; PLAN: r0=377(x1), r1=55(y1), r2=112(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 55
LDI r2, 112
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

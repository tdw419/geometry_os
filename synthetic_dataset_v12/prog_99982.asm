; DESCRIPTION: Renders a purple line between points (200, 135) and (341, 127).
; PLAN: r0=200(x1), r1=135(y1), r2=341(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 135
LDI r2, 341
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

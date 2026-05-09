; DESCRIPTION: Renders a purple line between points (92, 106) and (139, 163).
; PLAN: r0=92(x1), r1=106(y1), r2=139(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 106
LDI r2, 139
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

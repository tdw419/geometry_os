; DESCRIPTION: Renders a purple line between points (452, 158) and (163, 200).
; PLAN: r0=452(x1), r1=158(y1), r2=163(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 158
LDI r2, 163
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

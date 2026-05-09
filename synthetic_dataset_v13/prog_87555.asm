; DESCRIPTION: Draws a purple line from (382, 163) to (158, 185).
; PLAN: r0=382(x1), r1=163(y1), r2=158(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 163
LDI r2, 158
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

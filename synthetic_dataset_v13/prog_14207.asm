; DESCRIPTION: Draws a purple line from (163, 192) to (382, 17).
; PLAN: r0=163(x1), r1=192(y1), r2=382(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 192
LDI r2, 382
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (388, 192) and (175, 144).
; PLAN: r0=388(x1), r1=192(y1), r2=175(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 192
LDI r2, 175
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

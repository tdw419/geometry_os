; DESCRIPTION: Renders a purple line between points (466, 192) and (435, 90).
; PLAN: r0=466(x1), r1=192(y1), r2=435(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 192
LDI r2, 435
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

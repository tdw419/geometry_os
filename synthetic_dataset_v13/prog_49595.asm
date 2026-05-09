; DESCRIPTION: Renders a purple line between points (192, 29) and (157, 122).
; PLAN: r0=192(x1), r1=29(y1), r2=157(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 29
LDI r2, 157
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

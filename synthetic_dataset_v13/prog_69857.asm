; DESCRIPTION: Renders a blue line between points (192, 226) and (478, 130).
; PLAN: r0=192(x1), r1=226(y1), r2=478(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 226
LDI r2, 478
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

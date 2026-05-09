; DESCRIPTION: Renders a purple line between points (478, 178) and (139, 46).
; PLAN: r0=478(x1), r1=178(y1), r2=139(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 178
LDI r2, 139
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

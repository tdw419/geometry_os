; DESCRIPTION: Renders a magenta line between points (454, 192) and (478, 153).
; PLAN: r0=454(x1), r1=192(y1), r2=478(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 192
LDI r2, 478
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

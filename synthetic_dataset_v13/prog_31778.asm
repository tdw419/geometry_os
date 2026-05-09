; DESCRIPTION: Renders a blue line between points (153, 86) and (478, 177).
; PLAN: r0=153(x1), r1=86(y1), r2=478(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 86
LDI r2, 478
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

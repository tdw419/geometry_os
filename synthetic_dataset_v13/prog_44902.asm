; DESCRIPTION: Renders a blue line between points (297, 0) and (194, 237).
; PLAN: r0=297(x1), r1=0(y1), r2=194(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 0
LDI r2, 194
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

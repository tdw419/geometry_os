; DESCRIPTION: Renders a blue line between points (341, 244) and (177, 24).
; PLAN: r0=341(x1), r1=244(y1), r2=177(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 244
LDI r2, 177
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

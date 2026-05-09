; DESCRIPTION: Renders a blue line between points (478, 254) and (40, 154).
; PLAN: r0=478(x1), r1=254(y1), r2=40(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 254
LDI r2, 40
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

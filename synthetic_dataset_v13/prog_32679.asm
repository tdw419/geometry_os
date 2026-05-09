; DESCRIPTION: Renders a blue line between points (297, 185) and (55, 9).
; PLAN: r0=297(x1), r1=185(y1), r2=55(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 185
LDI r2, 55
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

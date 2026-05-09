; DESCRIPTION: Renders a blue line between points (137, 158) and (243, 106).
; PLAN: r0=137(x1), r1=158(y1), r2=243(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 158
LDI r2, 243
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue line between points (216, 17) and (188, 44).
; PLAN: r0=216(x1), r1=17(y1), r2=188(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 17
LDI r2, 188
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

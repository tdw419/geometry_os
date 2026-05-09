; DESCRIPTION: Renders a blue line between points (119, 206) and (62, 1).
; PLAN: r0=119(x1), r1=206(y1), r2=62(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 206
LDI r2, 62
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

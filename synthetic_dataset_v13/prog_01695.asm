; DESCRIPTION: Renders a blue line between points (62, 60) and (40, 88).
; PLAN: r0=62(x1), r1=60(y1), r2=40(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 60
LDI r2, 40
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

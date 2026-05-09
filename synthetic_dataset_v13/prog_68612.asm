; DESCRIPTION: Renders a blue line between points (175, 123) and (314, 255).
; PLAN: r0=175(x1), r1=123(y1), r2=314(x2), r3=255(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 123
LDI r2, 314
LDI r3, 255
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

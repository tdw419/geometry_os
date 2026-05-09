; DESCRIPTION: Renders a blue line between points (315, 230) and (99, 78).
; PLAN: r0=315(x1), r1=230(y1), r2=99(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 230
LDI r2, 99
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

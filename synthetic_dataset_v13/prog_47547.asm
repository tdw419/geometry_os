; DESCRIPTION: Renders a blue line between points (481, 78) and (416, 238).
; PLAN: r0=481(x1), r1=78(y1), r2=416(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 78
LDI r2, 416
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

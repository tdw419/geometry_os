; DESCRIPTION: Renders a blue line between points (1, 175) and (140, 238).
; PLAN: r0=1(x1), r1=175(y1), r2=140(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 175
LDI r2, 140
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

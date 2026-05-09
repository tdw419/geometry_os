; DESCRIPTION: Renders a blue line between points (96, 40) and (129, 2).
; PLAN: r0=96(x1), r1=40(y1), r2=129(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 40
LDI r2, 129
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

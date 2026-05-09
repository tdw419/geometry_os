; DESCRIPTION: Renders a blue line between points (484, 163) and (121, 138).
; PLAN: r0=484(x1), r1=163(y1), r2=121(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 163
LDI r2, 121
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

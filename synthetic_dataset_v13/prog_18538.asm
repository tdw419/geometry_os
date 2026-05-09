; DESCRIPTION: Renders a blue line between points (158, 81) and (486, 244).
; PLAN: r0=158(x1), r1=81(y1), r2=486(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 81
LDI r2, 486
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

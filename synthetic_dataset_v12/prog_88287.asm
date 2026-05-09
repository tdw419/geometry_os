; DESCRIPTION: Renders a black line between points (95, 100) and (163, 238).
; PLAN: r0=95(x1), r1=100(y1), r2=163(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 100
LDI r2, 163
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

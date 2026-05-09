; DESCRIPTION: Renders a blue line between points (102, 147) and (484, 139).
; PLAN: r0=102(x1), r1=147(y1), r2=484(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 147
LDI r2, 484
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

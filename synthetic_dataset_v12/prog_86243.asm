; DESCRIPTION: Renders a blue line between points (4, 85) and (484, 183).
; PLAN: r0=4(x1), r1=85(y1), r2=484(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 85
LDI r2, 484
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

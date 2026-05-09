; DESCRIPTION: Renders a purple line between points (411, 100) and (98, 254).
; PLAN: r0=411(x1), r1=100(y1), r2=98(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 100
LDI r2, 98
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

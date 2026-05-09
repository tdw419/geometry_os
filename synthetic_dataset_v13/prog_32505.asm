; DESCRIPTION: Renders a purple line between points (393, 34) and (137, 158).
; PLAN: r0=393(x1), r1=34(y1), r2=137(x2), r3=158(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 34
LDI r2, 137
LDI r3, 158
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

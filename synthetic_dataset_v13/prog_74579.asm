; DESCRIPTION: Renders a purple line between points (140, 226) and (55, 104).
; PLAN: r0=140(x1), r1=226(y1), r2=55(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 226
LDI r2, 55
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

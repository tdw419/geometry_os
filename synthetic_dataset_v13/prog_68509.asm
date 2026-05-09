; DESCRIPTION: Renders a purple line between points (477, 232) and (439, 104).
; PLAN: r0=477(x1), r1=232(y1), r2=439(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 232
LDI r2, 439
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

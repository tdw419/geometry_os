; DESCRIPTION: Renders a purple line between points (390, 104) and (133, 4).
; PLAN: r0=390(x1), r1=104(y1), r2=133(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 104
LDI r2, 133
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

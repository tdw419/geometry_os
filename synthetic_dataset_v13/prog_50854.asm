; DESCRIPTION: Renders a blue line between points (104, 220) and (390, 116).
; PLAN: r0=104(x1), r1=220(y1), r2=390(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 220
LDI r2, 390
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

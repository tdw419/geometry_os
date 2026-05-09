; DESCRIPTION: Renders a purple line between points (377, 17) and (420, 104).
; PLAN: r0=377(x1), r1=17(y1), r2=420(x2), r3=104(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 17
LDI r2, 420
LDI r3, 104
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

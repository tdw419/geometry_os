; DESCRIPTION: Renders a purple line between points (233, 198) and (400, 114).
; PLAN: r0=233(x1), r1=198(y1), r2=400(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 198
LDI r2, 400
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple line between points (390, 193) and (58, 60).
; PLAN: r0=390(x1), r1=193(y1), r2=58(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 193
LDI r2, 58
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

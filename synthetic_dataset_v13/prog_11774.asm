; DESCRIPTION: Renders a purple line between points (266, 155) and (76, 48).
; PLAN: r0=266(x1), r1=155(y1), r2=76(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 155
LDI r2, 76
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

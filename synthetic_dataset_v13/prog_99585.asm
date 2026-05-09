; DESCRIPTION: Renders a purple line between points (353, 31) and (325, 155).
; PLAN: r0=353(x1), r1=31(y1), r2=325(x2), r3=155(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 31
LDI r2, 325
LDI r3, 155
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

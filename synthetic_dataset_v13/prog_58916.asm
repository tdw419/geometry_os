; DESCRIPTION: Renders a purple line between points (151, 155) and (282, 1).
; PLAN: r0=151(x1), r1=155(y1), r2=282(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 155
LDI r2, 282
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

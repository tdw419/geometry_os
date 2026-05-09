; DESCRIPTION: Renders a purple line between points (347, 75) and (136, 185).
; PLAN: r0=347(x1), r1=75(y1), r2=136(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 75
LDI r2, 136
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

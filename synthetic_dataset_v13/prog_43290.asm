; DESCRIPTION: Renders a purple line between points (159, 87) and (222, 110).
; PLAN: r0=159(x1), r1=87(y1), r2=222(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 87
LDI r2, 222
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

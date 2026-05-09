; DESCRIPTION: Renders a purple line between points (200, 66) and (15, 110).
; PLAN: r0=200(x1), r1=66(y1), r2=15(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 66
LDI r2, 15
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (369, 119) to (273, 110).
; PLAN: r0=369(x1), r1=119(y1), r2=273(x2), r3=110(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 119
LDI r2, 273
LDI r3, 110
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

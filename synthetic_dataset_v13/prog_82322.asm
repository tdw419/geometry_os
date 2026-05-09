; DESCRIPTION: Places a purple line segment connecting (110, 9) to (204, 40).
; PLAN: r0=110(x1), r1=9(y1), r2=204(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 9
LDI r2, 204
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

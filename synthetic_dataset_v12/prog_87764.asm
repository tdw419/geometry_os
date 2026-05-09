; DESCRIPTION: Places a purple line segment connecting (244, 137) to (230, 119).
; PLAN: r0=244(x1), r1=137(y1), r2=230(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 137
LDI r2, 230
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

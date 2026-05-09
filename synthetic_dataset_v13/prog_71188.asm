; DESCRIPTION: Places a purple line segment connecting (30, 21) to (266, 137).
; PLAN: r0=30(x1), r1=21(y1), r2=266(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 21
LDI r2, 266
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

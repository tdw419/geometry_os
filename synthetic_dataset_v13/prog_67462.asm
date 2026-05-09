; DESCRIPTION: Places a purple line segment connecting (332, 55) to (431, 211).
; PLAN: r0=332(x1), r1=55(y1), r2=431(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 55
LDI r2, 431
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

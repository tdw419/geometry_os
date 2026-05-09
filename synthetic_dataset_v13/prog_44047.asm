; DESCRIPTION: Places a purple line segment connecting (192, 76) to (361, 185).
; PLAN: r0=192(x1), r1=76(y1), r2=361(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 76
LDI r2, 361
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

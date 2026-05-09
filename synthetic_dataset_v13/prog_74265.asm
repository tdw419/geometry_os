; DESCRIPTION: Places a purple line segment connecting (176, 43) to (431, 219).
; PLAN: r0=176(x1), r1=43(y1), r2=431(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 43
LDI r2, 431
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

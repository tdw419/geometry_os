; DESCRIPTION: Places a purple line segment connecting (390, 175) to (195, 133).
; PLAN: r0=390(x1), r1=175(y1), r2=195(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 175
LDI r2, 195
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

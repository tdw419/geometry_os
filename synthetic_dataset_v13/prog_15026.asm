; DESCRIPTION: Places a purple line segment connecting (263, 141) to (390, 8).
; PLAN: r0=263(x1), r1=141(y1), r2=390(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 141
LDI r2, 390
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

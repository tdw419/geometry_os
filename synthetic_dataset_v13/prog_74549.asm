; DESCRIPTION: Places a purple line segment connecting (454, 19) to (344, 8).
; PLAN: r0=454(x1), r1=19(y1), r2=344(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 19
LDI r2, 344
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

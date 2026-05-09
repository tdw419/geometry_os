; DESCRIPTION: Places a purple line segment connecting (1, 67) to (418, 185).
; PLAN: r0=1(x1), r1=67(y1), r2=418(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 67
LDI r2, 418
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (144, 70) to (477, 249).
; PLAN: r0=144(x1), r1=70(y1), r2=477(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 70
LDI r2, 477
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

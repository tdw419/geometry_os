; DESCRIPTION: Places a purple line segment connecting (291, 14) to (454, 60).
; PLAN: r0=291(x1), r1=14(y1), r2=454(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 14
LDI r2, 454
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

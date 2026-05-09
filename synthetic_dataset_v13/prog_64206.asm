; DESCRIPTION: Places a purple line segment connecting (269, 100) to (291, 49).
; PLAN: r0=269(x1), r1=100(y1), r2=291(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 100
LDI r2, 291
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

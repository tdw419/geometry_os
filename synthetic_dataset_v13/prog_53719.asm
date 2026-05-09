; DESCRIPTION: Places a purple line segment connecting (19, 22) to (124, 135).
; PLAN: r0=19(x1), r1=22(y1), r2=124(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 22
LDI r2, 124
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

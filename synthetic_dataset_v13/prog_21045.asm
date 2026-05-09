; DESCRIPTION: Places a purple line segment connecting (478, 124) to (291, 124).
; PLAN: r0=478(x1), r1=124(y1), r2=291(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 124
LDI r2, 291
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

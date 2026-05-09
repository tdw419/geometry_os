; DESCRIPTION: Places a black line segment connecting (322, 219) to (468, 245).
; PLAN: r0=322(x1), r1=219(y1), r2=468(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 219
LDI r2, 468
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

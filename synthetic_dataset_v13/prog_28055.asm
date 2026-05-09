; DESCRIPTION: Places a blue line segment connecting (291, 56) to (477, 192).
; PLAN: r0=291(x1), r1=56(y1), r2=477(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 56
LDI r2, 477
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

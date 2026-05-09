; DESCRIPTION: Places a purple line segment connecting (507, 1) to (64, 140).
; PLAN: r0=507(x1), r1=1(y1), r2=64(x2), r3=140(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 1
LDI r2, 64
LDI r3, 140
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

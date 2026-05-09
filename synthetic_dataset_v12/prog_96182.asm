; DESCRIPTION: Places a purple line segment connecting (375, 184) to (15, 238).
; PLAN: r0=375(x1), r1=184(y1), r2=15(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 184
LDI r2, 15
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

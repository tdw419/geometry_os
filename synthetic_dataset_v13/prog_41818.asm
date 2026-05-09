; DESCRIPTION: Places a purple line segment connecting (30, 40) to (100, 151).
; PLAN: r0=30(x1), r1=40(y1), r2=100(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 40
LDI r2, 100
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

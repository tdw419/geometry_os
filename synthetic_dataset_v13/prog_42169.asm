; DESCRIPTION: Places a purple line segment connecting (285, 124) to (116, 151).
; PLAN: r0=285(x1), r1=124(y1), r2=116(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 124
LDI r2, 116
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

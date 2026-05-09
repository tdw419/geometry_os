; DESCRIPTION: Places a purple line segment connecting (495, 67) to (96, 133).
; PLAN: r0=495(x1), r1=67(y1), r2=96(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 67
LDI r2, 96
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

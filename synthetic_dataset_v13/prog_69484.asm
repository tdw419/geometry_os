; DESCRIPTION: Places a purple line segment connecting (384, 255) to (511, 22).
; PLAN: r0=384(x1), r1=255(y1), r2=511(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 255
LDI r2, 511
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

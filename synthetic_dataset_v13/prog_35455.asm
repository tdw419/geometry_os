; DESCRIPTION: Places a purple line segment connecting (173, 204) to (341, 151).
; PLAN: r0=173(x1), r1=204(y1), r2=341(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 204
LDI r2, 341
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

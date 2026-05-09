; DESCRIPTION: Places a purple line segment connecting (446, 204) to (58, 151).
; PLAN: r0=446(x1), r1=204(y1), r2=58(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 204
LDI r2, 58
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

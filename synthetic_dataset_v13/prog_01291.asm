; DESCRIPTION: Renders a purple line between points (163, 101) and (38, 151).
; PLAN: r0=163(x1), r1=101(y1), r2=38(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 101
LDI r2, 38
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

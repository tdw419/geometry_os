; DESCRIPTION: Renders a purple line between points (222, 66) and (507, 151).
; PLAN: r0=222(x1), r1=66(y1), r2=507(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 66
LDI r2, 507
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

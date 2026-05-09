; DESCRIPTION: Renders a purple line between points (112, 86) and (256, 151).
; PLAN: r0=112(x1), r1=86(y1), r2=256(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 86
LDI r2, 256
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

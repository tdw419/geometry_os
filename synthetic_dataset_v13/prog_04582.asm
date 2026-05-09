; DESCRIPTION: Renders a yellow line between points (142, 96) and (334, 151).
; PLAN: r0=142(x1), r1=96(y1), r2=334(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 96
LDI r2, 334
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

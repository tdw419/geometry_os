; DESCRIPTION: Renders a yellow line between points (38, 227) and (339, 151).
; PLAN: r0=38(x1), r1=227(y1), r2=339(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 227
LDI r2, 339
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

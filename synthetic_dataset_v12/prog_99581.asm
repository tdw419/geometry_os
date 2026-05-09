; DESCRIPTION: Renders a blue line between points (34, 214) and (505, 151).
; PLAN: r0=34(x1), r1=214(y1), r2=505(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 214
LDI r2, 505
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

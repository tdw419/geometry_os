; DESCRIPTION: Renders a orange line between points (15, 139) and (484, 151).
; PLAN: r0=15(x1), r1=139(y1), r2=484(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 139
LDI r2, 484
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

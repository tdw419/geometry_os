; DESCRIPTION: Places a blue line segment connecting (25, 26) to (297, 151).
; PLAN: r0=25(x1), r1=26(y1), r2=297(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 26
LDI r2, 297
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

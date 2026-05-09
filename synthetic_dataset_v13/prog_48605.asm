; DESCRIPTION: Places a red line segment connecting (133, 175) to (307, 151).
; PLAN: r0=133(x1), r1=175(y1), r2=307(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 175
LDI r2, 307
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

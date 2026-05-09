; DESCRIPTION: Places a green line segment connecting (474, 118) to (174, 151).
; PLAN: r0=474(x1), r1=118(y1), r2=174(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 118
LDI r2, 174
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

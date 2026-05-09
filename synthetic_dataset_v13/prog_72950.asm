; DESCRIPTION: Places a green line segment connecting (476, 27) to (54, 151).
; PLAN: r0=476(x1), r1=27(y1), r2=54(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 27
LDI r2, 54
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

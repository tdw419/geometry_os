; DESCRIPTION: Places a green line segment connecting (324, 244) to (163, 151).
; PLAN: r0=324(x1), r1=244(y1), r2=163(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 244
LDI r2, 163
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

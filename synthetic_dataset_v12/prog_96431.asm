; DESCRIPTION: Places a green line segment connecting (168, 142) to (315, 151).
; PLAN: r0=168(x1), r1=142(y1), r2=315(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 142
LDI r2, 315
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

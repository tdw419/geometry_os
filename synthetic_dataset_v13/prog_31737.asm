; DESCRIPTION: Places a magenta line segment connecting (64, 109) to (425, 151).
; PLAN: r0=64(x1), r1=109(y1), r2=425(x2), r3=151(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 109
LDI r2, 425
LDI r3, 151
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

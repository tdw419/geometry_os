; DESCRIPTION: Places a blue line segment connecting (152, 99) to (327, 151).
; PLAN: r0=152(x1), r1=99(y1), r2=327(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 99
LDI r2, 327
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

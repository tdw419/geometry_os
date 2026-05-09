; DESCRIPTION: Places a green line segment connecting (464, 28) to (138, 151).
; PLAN: r0=464(x1), r1=28(y1), r2=138(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 28
LDI r2, 138
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

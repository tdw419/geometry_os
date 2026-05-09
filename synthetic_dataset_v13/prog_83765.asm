; DESCRIPTION: Places a yellow line segment connecting (346, 60) to (473, 151).
; PLAN: r0=346(x1), r1=60(y1), r2=473(x2), r3=151(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 60
LDI r2, 473
LDI r3, 151
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

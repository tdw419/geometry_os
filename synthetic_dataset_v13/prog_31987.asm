; DESCRIPTION: Places a blue line segment connecting (189, 189) to (476, 101).
; PLAN: r0=189(x1), r1=189(y1), r2=476(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 189
LDI r2, 476
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT

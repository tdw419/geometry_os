; DESCRIPTION: Places a green line segment connecting (356, 151) to (476, 60).
; PLAN: r0=356(x1), r1=151(y1), r2=476(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 151
LDI r2, 476
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

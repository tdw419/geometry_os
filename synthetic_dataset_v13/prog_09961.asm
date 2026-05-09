; DESCRIPTION: Places a yellow line segment connecting (189, 248) to (476, 16).
; PLAN: r0=189(x1), r1=248(y1), r2=476(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 248
LDI r2, 476
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a purple line segment connecting (187, 9) to (476, 224).
; PLAN: r0=187(x1), r1=9(y1), r2=476(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 9
LDI r2, 476
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

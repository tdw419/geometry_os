; DESCRIPTION: Places a white line segment connecting (259, 95) to (476, 211).
; PLAN: r0=259(x1), r1=95(y1), r2=476(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 95
LDI r2, 476
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

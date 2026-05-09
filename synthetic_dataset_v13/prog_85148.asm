; DESCRIPTION: Places a white line segment connecting (285, 252) to (476, 162).
; PLAN: r0=285(x1), r1=252(y1), r2=476(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 252
LDI r2, 476
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

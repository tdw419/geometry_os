; DESCRIPTION: Places a white line segment connecting (436, 175) to (476, 217).
; PLAN: r0=436(x1), r1=175(y1), r2=476(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 175
LDI r2, 476
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (476, 79) to (266, 8).
; PLAN: r0=476(x1), r1=79(y1), r2=266(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 79
LDI r2, 266
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

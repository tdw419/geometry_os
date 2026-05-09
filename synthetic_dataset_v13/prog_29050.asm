; DESCRIPTION: Places a white line segment connecting (266, 136) to (447, 31).
; PLAN: r0=266(x1), r1=136(y1), r2=447(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 136
LDI r2, 447
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

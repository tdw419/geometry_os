; DESCRIPTION: Places a white line segment connecting (447, 252) to (73, 22).
; PLAN: r0=447(x1), r1=252(y1), r2=73(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 252
LDI r2, 73
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

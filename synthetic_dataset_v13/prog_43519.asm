; DESCRIPTION: Places a white line segment connecting (314, 94) to (476, 169).
; PLAN: r0=314(x1), r1=94(y1), r2=476(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 94
LDI r2, 476
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

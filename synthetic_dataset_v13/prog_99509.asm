; DESCRIPTION: Places a black line segment connecting (447, 148) to (58, 214).
; PLAN: r0=447(x1), r1=148(y1), r2=58(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 148
LDI r2, 58
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

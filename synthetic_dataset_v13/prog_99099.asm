; DESCRIPTION: Places a black line segment connecting (16, 194) to (447, 214).
; PLAN: r0=16(x1), r1=194(y1), r2=447(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 194
LDI r2, 447
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

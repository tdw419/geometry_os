; DESCRIPTION: Places a yellow line segment connecting (447, 202) to (227, 178).
; PLAN: r0=447(x1), r1=202(y1), r2=227(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 202
LDI r2, 227
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

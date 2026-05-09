; DESCRIPTION: Places a yellow line segment connecting (447, 61) to (147, 107).
; PLAN: r0=447(x1), r1=61(y1), r2=147(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 61
LDI r2, 147
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

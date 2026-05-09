; DESCRIPTION: Places a yellow line segment connecting (447, 12) to (428, 156).
; PLAN: r0=447(x1), r1=12(y1), r2=428(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 12
LDI r2, 428
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

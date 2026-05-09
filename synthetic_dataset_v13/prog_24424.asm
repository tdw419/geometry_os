; DESCRIPTION: Places a yellow line segment connecting (44, 192) to (447, 105).
; PLAN: r0=44(x1), r1=192(y1), r2=447(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 192
LDI r2, 447
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

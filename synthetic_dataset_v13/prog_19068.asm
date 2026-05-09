; DESCRIPTION: Places a green line segment connecting (447, 169) to (272, 22).
; PLAN: r0=447(x1), r1=169(y1), r2=272(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 169
LDI r2, 272
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (497, 218) to (240, 147).
; PLAN: r0=497(x1), r1=218(y1), r2=240(x2), r3=147(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 218
LDI r2, 240
LDI r3, 147
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

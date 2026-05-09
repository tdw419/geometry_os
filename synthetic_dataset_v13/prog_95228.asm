; DESCRIPTION: Places a black line segment connecting (351, 66) to (447, 110).
; PLAN: r0=351(x1), r1=66(y1), r2=447(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 66
LDI r2, 447
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

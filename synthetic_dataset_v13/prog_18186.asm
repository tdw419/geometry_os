; DESCRIPTION: Places a black line segment connecting (418, 85) to (472, 192).
; PLAN: r0=418(x1), r1=85(y1), r2=472(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 85
LDI r2, 472
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

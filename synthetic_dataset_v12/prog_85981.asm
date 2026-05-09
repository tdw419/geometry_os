; DESCRIPTION: Places a black line segment connecting (490, 137) to (323, 7).
; PLAN: r0=490(x1), r1=137(y1), r2=323(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 137
LDI r2, 323
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

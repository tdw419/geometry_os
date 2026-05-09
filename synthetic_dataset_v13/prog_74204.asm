; DESCRIPTION: Places a black line segment connecting (312, 109) to (17, 147).
; PLAN: r0=312(x1), r1=109(y1), r2=17(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 109
LDI r2, 17
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (2, 88) to (14, 147).
; PLAN: r0=2(x1), r1=88(y1), r2=14(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 88
LDI r2, 14
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

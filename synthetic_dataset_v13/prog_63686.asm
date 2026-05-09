; DESCRIPTION: Places a black line segment connecting (132, 0) to (448, 147).
; PLAN: r0=132(x1), r1=0(y1), r2=448(x2), r3=147(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 0
LDI r2, 448
LDI r3, 147
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

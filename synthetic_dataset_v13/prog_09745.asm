; DESCRIPTION: Places a black line segment connecting (427, 20) to (451, 58).
; PLAN: r0=427(x1), r1=20(y1), r2=451(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 20
LDI r2, 451
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (431, 110) to (366, 23).
; PLAN: r0=431(x1), r1=110(y1), r2=366(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 110
LDI r2, 366
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

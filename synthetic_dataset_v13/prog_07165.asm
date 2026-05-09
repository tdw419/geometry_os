; DESCRIPTION: Places a black line segment connecting (201, 175) to (132, 23).
; PLAN: r0=201(x1), r1=175(y1), r2=132(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 175
LDI r2, 132
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

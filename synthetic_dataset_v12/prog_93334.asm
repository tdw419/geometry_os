; DESCRIPTION: Places a black line segment connecting (390, 16) to (100, 58).
; PLAN: r0=390(x1), r1=16(y1), r2=100(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 16
LDI r2, 100
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

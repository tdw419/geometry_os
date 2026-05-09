; DESCRIPTION: Places a black line segment connecting (457, 135) to (390, 132).
; PLAN: r0=457(x1), r1=135(y1), r2=390(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 135
LDI r2, 390
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

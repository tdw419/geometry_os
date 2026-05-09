; DESCRIPTION: Places a black line segment connecting (43, 29) to (468, 175).
; PLAN: r0=43(x1), r1=29(y1), r2=468(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 29
LDI r2, 468
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

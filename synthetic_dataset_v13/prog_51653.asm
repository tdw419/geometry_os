; DESCRIPTION: Places a black line segment connecting (40, 156) to (430, 78).
; PLAN: r0=40(x1), r1=156(y1), r2=430(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 156
LDI r2, 430
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

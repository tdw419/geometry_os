; DESCRIPTION: Places a black line segment connecting (17, 203) to (355, 201).
; PLAN: r0=17(x1), r1=203(y1), r2=355(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 203
LDI r2, 355
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

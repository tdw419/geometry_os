; DESCRIPTION: Places a black line segment connecting (76, 170) to (473, 17).
; PLAN: r0=76(x1), r1=170(y1), r2=473(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 170
LDI r2, 473
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

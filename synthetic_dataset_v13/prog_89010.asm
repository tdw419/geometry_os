; DESCRIPTION: Places a black line segment connecting (449, 170) to (258, 216).
; PLAN: r0=449(x1), r1=170(y1), r2=258(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 170
LDI r2, 258
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

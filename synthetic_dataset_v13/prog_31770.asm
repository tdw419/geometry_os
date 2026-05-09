; DESCRIPTION: Places a black line segment connecting (449, 13) to (314, 172).
; PLAN: r0=449(x1), r1=13(y1), r2=314(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 13
LDI r2, 314
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

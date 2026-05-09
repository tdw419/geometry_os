; DESCRIPTION: Places a black line segment connecting (508, 37) to (475, 56).
; PLAN: r0=508(x1), r1=37(y1), r2=475(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 37
LDI r2, 475
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

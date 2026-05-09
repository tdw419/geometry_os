; DESCRIPTION: Places a black line segment connecting (498, 212) to (314, 87).
; PLAN: r0=498(x1), r1=212(y1), r2=314(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 212
LDI r2, 314
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

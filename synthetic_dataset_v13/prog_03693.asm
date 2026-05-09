; DESCRIPTION: Places a black line segment connecting (314, 191) to (45, 169).
; PLAN: r0=314(x1), r1=191(y1), r2=45(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 191
LDI r2, 45
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

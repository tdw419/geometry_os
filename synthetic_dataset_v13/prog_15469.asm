; DESCRIPTION: Places a black line segment connecting (181, 191) to (486, 157).
; PLAN: r0=181(x1), r1=191(y1), r2=486(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 191
LDI r2, 486
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

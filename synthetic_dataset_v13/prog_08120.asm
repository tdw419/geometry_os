; DESCRIPTION: Places a black line segment connecting (343, 89) to (369, 194).
; PLAN: r0=343(x1), r1=89(y1), r2=369(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 89
LDI r2, 369
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

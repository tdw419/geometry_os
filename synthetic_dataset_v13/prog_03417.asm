; DESCRIPTION: Places a black line segment connecting (477, 5) to (232, 169).
; PLAN: r0=477(x1), r1=5(y1), r2=232(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 5
LDI r2, 232
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

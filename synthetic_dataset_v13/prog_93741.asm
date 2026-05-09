; DESCRIPTION: Places a black line segment connecting (112, 81) to (314, 72).
; PLAN: r0=112(x1), r1=81(y1), r2=314(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 81
LDI r2, 314
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

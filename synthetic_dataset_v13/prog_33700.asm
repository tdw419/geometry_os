; DESCRIPTION: Places a white line segment connecting (314, 43) to (312, 112).
; PLAN: r0=314(x1), r1=43(y1), r2=312(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 43
LDI r2, 312
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

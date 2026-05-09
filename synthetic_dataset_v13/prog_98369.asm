; DESCRIPTION: Places a white line segment connecting (51, 88) to (376, 170).
; PLAN: r0=51(x1), r1=88(y1), r2=376(x2), r3=170(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 88
LDI r2, 376
LDI r3, 170
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

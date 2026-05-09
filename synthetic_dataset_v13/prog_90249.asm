; DESCRIPTION: Places a black line segment connecting (316, 227) to (495, 43).
; PLAN: r0=316(x1), r1=227(y1), r2=495(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 227
LDI r2, 495
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

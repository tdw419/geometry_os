; DESCRIPTION: Places a black line segment connecting (316, 2) to (103, 181).
; PLAN: r0=316(x1), r1=2(y1), r2=103(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 2
LDI r2, 103
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

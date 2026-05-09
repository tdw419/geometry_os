; DESCRIPTION: Renders a black line between points (78, 32) and (316, 170).
; PLAN: r0=78(x1), r1=32(y1), r2=316(x2), r3=170(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 32
LDI r2, 316
LDI r3, 170
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

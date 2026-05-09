; DESCRIPTION: Places a yellow line segment connecting (400, 105) to (316, 220).
; PLAN: r0=400(x1), r1=105(y1), r2=316(x2), r3=220(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 105
LDI r2, 316
LDI r3, 220
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (287, 239) to (316, 251).
; PLAN: r0=287(x1), r1=239(y1), r2=316(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 239
LDI r2, 316
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

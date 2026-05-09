; DESCRIPTION: Places a orange line segment connecting (353, 73) to (316, 218).
; PLAN: r0=353(x1), r1=73(y1), r2=316(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 73
LDI r2, 316
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

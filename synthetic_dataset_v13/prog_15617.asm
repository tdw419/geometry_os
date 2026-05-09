; DESCRIPTION: Places a orange line segment connecting (119, 223) to (276, 104).
; PLAN: r0=119(x1), r1=223(y1), r2=276(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 223
LDI r2, 276
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

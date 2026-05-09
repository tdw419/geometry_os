; DESCRIPTION: Places a orange line segment connecting (287, 203) to (19, 104).
; PLAN: r0=287(x1), r1=203(y1), r2=19(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 203
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

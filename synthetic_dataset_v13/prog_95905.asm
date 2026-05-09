; DESCRIPTION: Places a orange line segment connecting (314, 187) to (104, 82).
; PLAN: r0=314(x1), r1=187(y1), r2=104(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 187
LDI r2, 104
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

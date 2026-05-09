; DESCRIPTION: Places a orange line segment connecting (49, 207) to (187, 232).
; PLAN: r0=49(x1), r1=207(y1), r2=187(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 207
LDI r2, 187
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

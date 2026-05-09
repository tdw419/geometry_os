; DESCRIPTION: Places a orange line segment connecting (425, 78) to (49, 222).
; PLAN: r0=425(x1), r1=78(y1), r2=49(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 78
LDI r2, 49
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

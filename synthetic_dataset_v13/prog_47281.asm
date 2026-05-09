; DESCRIPTION: Places a orange line segment connecting (170, 12) to (223, 104).
; PLAN: r0=170(x1), r1=12(y1), r2=223(x2), r3=104(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 12
LDI r2, 223
LDI r3, 104
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

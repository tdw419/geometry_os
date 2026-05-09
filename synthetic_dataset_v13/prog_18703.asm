; DESCRIPTION: Places a orange line segment connecting (53, 75) to (123, 165).
; PLAN: r0=53(x1), r1=75(y1), r2=123(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 75
LDI r2, 123
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (226, 5) to (53, 123).
; PLAN: r0=226(x1), r1=5(y1), r2=53(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 5
LDI r2, 53
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (100, 239) to (201, 41).
; PLAN: r0=100(x1), r1=239(y1), r2=201(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 239
LDI r2, 201
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

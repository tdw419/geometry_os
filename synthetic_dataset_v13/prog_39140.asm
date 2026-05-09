; DESCRIPTION: Places a orange line segment connecting (41, 115) to (495, 23).
; PLAN: r0=41(x1), r1=115(y1), r2=495(x2), r3=23(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 115
LDI r2, 495
LDI r3, 23
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

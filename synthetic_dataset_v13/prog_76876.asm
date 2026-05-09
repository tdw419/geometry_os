; DESCRIPTION: Places a orange line segment connecting (17, 44) to (469, 41).
; PLAN: r0=17(x1), r1=44(y1), r2=469(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 44
LDI r2, 469
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

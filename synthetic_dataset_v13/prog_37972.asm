; DESCRIPTION: Places a red line segment connecting (2, 254) to (41, 122).
; PLAN: r0=2(x1), r1=254(y1), r2=41(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 254
LDI r2, 41
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

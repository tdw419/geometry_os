; DESCRIPTION: Renders a orange line between points (379, 41) and (430, 88).
; PLAN: r0=379(x1), r1=41(y1), r2=430(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 41
LDI r2, 430
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

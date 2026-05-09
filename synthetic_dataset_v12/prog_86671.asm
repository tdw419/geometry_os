; DESCRIPTION: Renders a orange line between points (252, 41) and (89, 234).
; PLAN: r0=252(x1), r1=41(y1), r2=89(x2), r3=234(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 41
LDI r2, 89
LDI r3, 234
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

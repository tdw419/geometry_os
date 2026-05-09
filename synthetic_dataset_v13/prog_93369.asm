; DESCRIPTION: Renders a orange line between points (41, 252) and (115, 239).
; PLAN: r0=41(x1), r1=252(y1), r2=115(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 252
LDI r2, 115
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

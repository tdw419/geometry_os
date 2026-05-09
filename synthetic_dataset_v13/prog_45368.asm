; DESCRIPTION: Renders a orange line between points (266, 238) and (486, 41).
; PLAN: r0=266(x1), r1=238(y1), r2=486(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 238
LDI r2, 486
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

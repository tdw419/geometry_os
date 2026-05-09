; DESCRIPTION: Renders a orange line between points (25, 41) and (365, 62).
; PLAN: r0=25(x1), r1=41(y1), r2=365(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 41
LDI r2, 365
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

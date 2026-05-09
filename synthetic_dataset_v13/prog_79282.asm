; DESCRIPTION: Renders a orange line between points (83, 12) and (406, 41).
; PLAN: r0=83(x1), r1=12(y1), r2=406(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 12
LDI r2, 406
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

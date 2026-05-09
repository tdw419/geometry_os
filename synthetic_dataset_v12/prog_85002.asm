; DESCRIPTION: Renders a orange line between points (41, 113) and (233, 36).
; PLAN: r0=41(x1), r1=113(y1), r2=233(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 113
LDI r2, 233
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

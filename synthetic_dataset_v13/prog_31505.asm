; DESCRIPTION: Renders a orange line between points (41, 17) and (475, 162).
; PLAN: r0=41(x1), r1=17(y1), r2=475(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 17
LDI r2, 475
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

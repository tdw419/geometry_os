; DESCRIPTION: Renders a orange line between points (181, 41) and (12, 177).
; PLAN: r0=181(x1), r1=41(y1), r2=12(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 41
LDI r2, 12
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

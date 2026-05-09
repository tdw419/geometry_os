; DESCRIPTION: Renders a orange line between points (66, 223) and (41, 45).
; PLAN: r0=66(x1), r1=223(y1), r2=41(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 223
LDI r2, 41
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

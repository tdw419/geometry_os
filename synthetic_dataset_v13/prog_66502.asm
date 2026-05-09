; DESCRIPTION: Draws a orange line from (18, 247) to (41, 91).
; PLAN: r0=18(x1), r1=247(y1), r2=41(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 247
LDI r2, 41
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

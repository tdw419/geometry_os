; DESCRIPTION: Draws a orange line from (41, 178) to (51, 102).
; PLAN: r0=41(x1), r1=178(y1), r2=51(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 178
LDI r2, 51
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

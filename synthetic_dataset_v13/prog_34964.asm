; DESCRIPTION: Draws a orange line from (282, 41) to (170, 7).
; PLAN: r0=282(x1), r1=41(y1), r2=170(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 41
LDI r2, 170
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

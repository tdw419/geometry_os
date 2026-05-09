; DESCRIPTION: Renders a orange line between points (219, 164) and (41, 127).
; PLAN: r0=219(x1), r1=164(y1), r2=41(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 164
LDI r2, 41
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

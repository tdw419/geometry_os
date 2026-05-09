; DESCRIPTION: Draws a orange line from (112, 41) to (362, 60).
; PLAN: r0=112(x1), r1=41(y1), r2=362(x2), r3=60(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 41
LDI r2, 362
LDI r3, 60
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

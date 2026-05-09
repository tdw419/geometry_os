; DESCRIPTION: Draws a orange line from (269, 226) to (491, 41).
; PLAN: r0=269(x1), r1=226(y1), r2=491(x2), r3=41(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 226
LDI r2, 491
LDI r3, 41
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

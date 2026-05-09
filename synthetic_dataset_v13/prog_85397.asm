; DESCRIPTION: Draws a orange line from (232, 114) to (507, 72).
; PLAN: r0=232(x1), r1=114(y1), r2=507(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 114
LDI r2, 507
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

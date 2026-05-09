; DESCRIPTION: Draws a orange line from (488, 245) to (232, 43).
; PLAN: r0=488(x1), r1=245(y1), r2=232(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 245
LDI r2, 232
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

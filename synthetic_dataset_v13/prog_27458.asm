; DESCRIPTION: Draws a orange line from (292, 24) to (58, 122).
; PLAN: r0=292(x1), r1=24(y1), r2=58(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 24
LDI r2, 58
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

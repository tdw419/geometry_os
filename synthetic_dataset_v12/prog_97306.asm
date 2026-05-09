; DESCRIPTION: Draws a orange line from (58, 246) to (496, 157).
; PLAN: r0=58(x1), r1=246(y1), r2=496(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 246
LDI r2, 496
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

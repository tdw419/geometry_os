; DESCRIPTION: Draws a orange line from (391, 141) to (477, 153).
; PLAN: r0=391(x1), r1=141(y1), r2=477(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 141
LDI r2, 477
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

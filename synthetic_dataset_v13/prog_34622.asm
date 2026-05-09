; DESCRIPTION: Draws a orange line from (355, 166) to (497, 1).
; PLAN: r0=355(x1), r1=166(y1), r2=497(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 166
LDI r2, 497
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

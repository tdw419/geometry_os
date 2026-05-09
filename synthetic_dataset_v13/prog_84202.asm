; DESCRIPTION: Draws a orange line from (207, 40) to (343, 122).
; PLAN: r0=207(x1), r1=40(y1), r2=343(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 40
LDI r2, 343
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

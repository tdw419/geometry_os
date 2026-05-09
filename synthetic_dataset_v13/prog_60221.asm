; DESCRIPTION: Draws a orange line from (367, 98) to (114, 122).
; PLAN: r0=367(x1), r1=98(y1), r2=114(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 98
LDI r2, 114
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

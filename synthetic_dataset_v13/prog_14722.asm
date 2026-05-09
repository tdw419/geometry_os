; DESCRIPTION: Draws a orange line from (25, 25) to (44, 43).
; PLAN: r0=25(x1), r1=25(y1), r2=44(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 25
LDI r2, 44
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

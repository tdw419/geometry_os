; DESCRIPTION: Draws a orange line from (159, 74) to (137, 84).
; PLAN: r0=159(x1), r1=74(y1), r2=137(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 74
LDI r2, 137
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

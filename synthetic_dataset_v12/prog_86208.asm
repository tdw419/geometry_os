; DESCRIPTION: Draws a orange line from (159, 162) to (352, 246).
; PLAN: r0=159(x1), r1=162(y1), r2=352(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 162
LDI r2, 352
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

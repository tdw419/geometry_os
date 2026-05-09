; DESCRIPTION: Draws a orange line from (499, 195) to (352, 205).
; PLAN: r0=499(x1), r1=195(y1), r2=352(x2), r3=205(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 195
LDI r2, 352
LDI r3, 205
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

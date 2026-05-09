; DESCRIPTION: Draws a orange line from (183, 76) to (309, 66).
; PLAN: r0=183(x1), r1=76(y1), r2=309(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 76
LDI r2, 309
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

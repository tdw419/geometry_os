; DESCRIPTION: Draws a orange line from (511, 182) to (97, 203).
; PLAN: r0=511(x1), r1=182(y1), r2=97(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 182
LDI r2, 97
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (194, 39) to (6, 114).
; PLAN: r0=194(x1), r1=39(y1), r2=6(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 39
LDI r2, 6
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

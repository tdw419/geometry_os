; DESCRIPTION: Draws a orange line from (238, 218) to (194, 25).
; PLAN: r0=238(x1), r1=218(y1), r2=194(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 218
LDI r2, 194
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

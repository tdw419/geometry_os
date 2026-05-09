; DESCRIPTION: Draws a orange line from (238, 227) to (441, 252).
; PLAN: r0=238(x1), r1=227(y1), r2=441(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 227
LDI r2, 441
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

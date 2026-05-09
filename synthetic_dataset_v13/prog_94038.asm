; DESCRIPTION: Draws a orange line from (238, 92) to (478, 84).
; PLAN: r0=238(x1), r1=92(y1), r2=478(x2), r3=84(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 92
LDI r2, 478
LDI r3, 84
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

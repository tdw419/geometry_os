; DESCRIPTION: Draws a orange line from (40, 82) to (134, 199).
; PLAN: r0=40(x1), r1=82(y1), r2=134(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 82
LDI r2, 134
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

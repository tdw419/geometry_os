; DESCRIPTION: Draws a orange line from (238, 188) to (13, 61).
; PLAN: r0=238(x1), r1=188(y1), r2=13(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 188
LDI r2, 13
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

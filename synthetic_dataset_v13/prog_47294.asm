; DESCRIPTION: Draws a orange line from (134, 221) to (484, 212).
; PLAN: r0=134(x1), r1=221(y1), r2=484(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 221
LDI r2, 484
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (278, 29) to (165, 212).
; PLAN: r0=278(x1), r1=29(y1), r2=165(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 29
LDI r2, 165
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

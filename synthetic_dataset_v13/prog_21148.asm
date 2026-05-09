; DESCRIPTION: Draws a orange line from (459, 62) to (456, 250).
; PLAN: r0=459(x1), r1=62(y1), r2=456(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 62
LDI r2, 456
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

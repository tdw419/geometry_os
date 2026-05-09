; DESCRIPTION: Draws a orange line from (456, 2) to (19, 39).
; PLAN: r0=456(x1), r1=2(y1), r2=19(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 2
LDI r2, 19
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

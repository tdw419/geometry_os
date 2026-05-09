; DESCRIPTION: Draws a orange line from (25, 255) to (114, 121).
; PLAN: r0=25(x1), r1=255(y1), r2=114(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 255
LDI r2, 114
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

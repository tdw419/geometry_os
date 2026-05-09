; DESCRIPTION: Draws a orange line from (309, 49) to (4, 121).
; PLAN: r0=309(x1), r1=49(y1), r2=4(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 49
LDI r2, 4
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

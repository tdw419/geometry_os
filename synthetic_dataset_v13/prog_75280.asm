; DESCRIPTION: Draws a orange line from (149, 52) to (285, 74).
; PLAN: r0=149(x1), r1=52(y1), r2=285(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 52
LDI r2, 285
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

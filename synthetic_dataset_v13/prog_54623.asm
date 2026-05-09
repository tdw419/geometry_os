; DESCRIPTION: Draws a orange line from (395, 21) to (285, 121).
; PLAN: r0=395(x1), r1=21(y1), r2=285(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 21
LDI r2, 285
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

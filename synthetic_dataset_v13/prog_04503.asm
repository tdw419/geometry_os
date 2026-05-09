; DESCRIPTION: Draws a orange line from (261, 121) to (96, 89).
; PLAN: r0=261(x1), r1=121(y1), r2=96(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 121
LDI r2, 96
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

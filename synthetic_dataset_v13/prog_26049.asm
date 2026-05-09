; DESCRIPTION: Draws a orange line from (287, 238) to (145, 162).
; PLAN: r0=287(x1), r1=238(y1), r2=145(x2), r3=162(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 238
LDI r2, 145
LDI r3, 162
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

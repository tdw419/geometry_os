; DESCRIPTION: Draws a orange line from (102, 113) to (412, 10).
; PLAN: r0=102(x1), r1=113(y1), r2=412(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 113
LDI r2, 412
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (55, 121) to (313, 0).
; PLAN: r0=55(x1), r1=121(y1), r2=313(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 121
LDI r2, 313
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

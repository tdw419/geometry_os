; DESCRIPTION: Draws a orange line from (266, 84) to (481, 102).
; PLAN: r0=266(x1), r1=84(y1), r2=481(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 84
LDI r2, 481
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

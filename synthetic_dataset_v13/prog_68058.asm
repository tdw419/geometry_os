; DESCRIPTION: Draws a orange line from (28, 135) to (122, 78).
; PLAN: r0=28(x1), r1=135(y1), r2=122(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 135
LDI r2, 122
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange line from (501, 160) to (310, 100).
; PLAN: r0=501(x1), r1=160(y1), r2=310(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 160
LDI r2, 310
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

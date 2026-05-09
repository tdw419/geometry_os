; DESCRIPTION: Draws a orange line from (501, 25) to (22, 39).
; PLAN: r0=501(x1), r1=25(y1), r2=22(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 25
LDI r2, 22
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

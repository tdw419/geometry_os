; DESCRIPTION: Draws a orange line from (278, 170) to (28, 25).
; PLAN: r0=278(x1), r1=170(y1), r2=28(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 170
LDI r2, 28
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

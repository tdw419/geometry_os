; DESCRIPTION: Draws a orange line from (28, 155) to (354, 156).
; PLAN: r0=28(x1), r1=155(y1), r2=354(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 155
LDI r2, 354
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

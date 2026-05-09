; DESCRIPTION: Draws a orange line from (496, 119) to (230, 22).
; PLAN: r0=496(x1), r1=119(y1), r2=230(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 119
LDI r2, 230
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

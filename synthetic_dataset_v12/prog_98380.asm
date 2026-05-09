; DESCRIPTION: Draws a orange line from (84, 97) to (507, 81).
; PLAN: r0=84(x1), r1=97(y1), r2=507(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 97
LDI r2, 507
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

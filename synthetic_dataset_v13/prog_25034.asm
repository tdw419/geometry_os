; DESCRIPTION: Draws a orange line from (24, 105) to (472, 22).
; PLAN: r0=24(x1), r1=105(y1), r2=472(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 105
LDI r2, 472
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

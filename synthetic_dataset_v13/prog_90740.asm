; DESCRIPTION: Draws a orange line from (472, 106) to (476, 26).
; PLAN: r0=472(x1), r1=106(y1), r2=476(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 106
LDI r2, 476
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

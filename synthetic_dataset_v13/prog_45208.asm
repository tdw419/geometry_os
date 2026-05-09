; DESCRIPTION: Draws a orange line from (11, 22) to (505, 165).
; PLAN: r0=11(x1), r1=22(y1), r2=505(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 22
LDI r2, 505
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

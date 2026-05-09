; DESCRIPTION: Draws a orange line from (101, 166) to (181, 26).
; PLAN: r0=101(x1), r1=166(y1), r2=181(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 166
LDI r2, 181
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

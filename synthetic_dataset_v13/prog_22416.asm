; DESCRIPTION: Draws a orange line from (416, 28) to (6, 181).
; PLAN: r0=416(x1), r1=28(y1), r2=6(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 28
LDI r2, 6
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

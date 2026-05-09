; DESCRIPTION: Draws a orange line from (227, 108) to (43, 59).
; PLAN: r0=227(x1), r1=108(y1), r2=43(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 108
LDI r2, 43
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

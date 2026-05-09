; DESCRIPTION: Draws a orange line from (62, 17) to (249, 69).
; PLAN: r0=62(x1), r1=17(y1), r2=249(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 17
LDI r2, 249
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

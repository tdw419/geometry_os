; DESCRIPTION: Draws a orange line from (249, 155) to (420, 43).
; PLAN: r0=249(x1), r1=155(y1), r2=420(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 155
LDI r2, 420
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

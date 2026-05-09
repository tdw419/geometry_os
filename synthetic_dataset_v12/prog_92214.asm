; DESCRIPTION: Draws a orange line from (189, 234) to (426, 181).
; PLAN: r0=189(x1), r1=234(y1), r2=426(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 234
LDI r2, 426
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

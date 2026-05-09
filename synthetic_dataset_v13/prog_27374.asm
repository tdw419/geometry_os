; DESCRIPTION: Draws a orange line from (314, 172) to (491, 239).
; PLAN: r0=314(x1), r1=172(y1), r2=491(x2), r3=239(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 172
LDI r2, 491
LDI r3, 239
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

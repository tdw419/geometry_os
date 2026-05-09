; DESCRIPTION: Draws a orange line from (165, 132) to (122, 72).
; PLAN: r0=165(x1), r1=132(y1), r2=122(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 132
LDI r2, 122
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

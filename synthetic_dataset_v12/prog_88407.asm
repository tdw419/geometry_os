; DESCRIPTION: Draws a orange line from (497, 32) to (325, 165).
; PLAN: r0=497(x1), r1=32(y1), r2=325(x2), r3=165(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 32
LDI r2, 325
LDI r3, 165
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

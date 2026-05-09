; DESCRIPTION: Draws a orange line from (497, 140) to (32, 100).
; PLAN: r0=497(x1), r1=140(y1), r2=32(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 140
LDI r2, 32
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a orange line segment connecting (497, 165) to (215, 159).
; PLAN: r0=497(x1), r1=165(y1), r2=215(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 165
LDI r2, 215
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

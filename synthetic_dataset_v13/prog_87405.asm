; DESCRIPTION: Places a orange line segment connecting (28, 157) to (266, 155).
; PLAN: r0=28(x1), r1=157(y1), r2=266(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 157
LDI r2, 266
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

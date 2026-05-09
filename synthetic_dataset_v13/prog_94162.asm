; DESCRIPTION: Places a orange line segment connecting (80, 171) to (497, 130).
; PLAN: r0=80(x1), r1=171(y1), r2=497(x2), r3=130(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 171
LDI r2, 497
LDI r3, 130
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

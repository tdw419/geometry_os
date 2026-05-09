; DESCRIPTION: Places a orange line segment connecting (497, 68) to (359, 226).
; PLAN: r0=497(x1), r1=68(y1), r2=359(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 68
LDI r2, 359
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

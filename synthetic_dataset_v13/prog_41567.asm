; DESCRIPTION: Places a orange line segment connecting (261, 232) to (310, 187).
; PLAN: r0=261(x1), r1=232(y1), r2=310(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 232
LDI r2, 310
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

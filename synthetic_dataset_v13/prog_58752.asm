; DESCRIPTION: Places a orange line segment connecting (221, 245) to (69, 232).
; PLAN: r0=221(x1), r1=245(y1), r2=69(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 245
LDI r2, 69
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

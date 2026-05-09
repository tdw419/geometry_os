; DESCRIPTION: Places a orange line segment connecting (67, 232) to (275, 99).
; PLAN: r0=67(x1), r1=232(y1), r2=275(x2), r3=99(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 232
LDI r2, 275
LDI r3, 99
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

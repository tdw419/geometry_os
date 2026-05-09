; DESCRIPTION: Places a orange line segment connecting (122, 21) to (402, 232).
; PLAN: r0=122(x1), r1=21(y1), r2=402(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 21
LDI r2, 402
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

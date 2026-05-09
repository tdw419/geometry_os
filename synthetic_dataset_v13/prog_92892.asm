; DESCRIPTION: Places a orange line segment connecting (232, 63) to (444, 171).
; PLAN: r0=232(x1), r1=63(y1), r2=444(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 63
LDI r2, 444
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

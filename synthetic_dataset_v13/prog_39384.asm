; DESCRIPTION: Places a orange line segment connecting (174, 227) to (184, 191).
; PLAN: r0=174(x1), r1=227(y1), r2=184(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 227
LDI r2, 184
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

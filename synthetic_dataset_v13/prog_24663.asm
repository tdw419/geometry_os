; DESCRIPTION: Places a orange line segment connecting (437, 13) to (496, 250).
; PLAN: r0=437(x1), r1=13(y1), r2=496(x2), r3=250(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 13
LDI r2, 496
LDI r3, 250
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

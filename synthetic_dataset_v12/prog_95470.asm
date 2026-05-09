; DESCRIPTION: Places a orange line segment connecting (496, 236) to (28, 95).
; PLAN: r0=496(x1), r1=236(y1), r2=28(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 236
LDI r2, 28
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

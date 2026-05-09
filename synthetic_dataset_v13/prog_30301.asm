; DESCRIPTION: Places a orange line segment connecting (496, 149) to (143, 81).
; PLAN: r0=496(x1), r1=149(y1), r2=143(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 149
LDI r2, 143
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

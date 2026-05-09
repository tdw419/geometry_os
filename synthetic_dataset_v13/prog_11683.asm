; DESCRIPTION: Places a orange line segment connecting (183, 26) to (426, 137).
; PLAN: r0=183(x1), r1=26(y1), r2=426(x2), r3=137(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 26
LDI r2, 426
LDI r3, 137
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

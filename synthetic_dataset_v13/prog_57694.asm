; DESCRIPTION: Places a orange line segment connecting (157, 107) to (421, 26).
; PLAN: r0=157(x1), r1=107(y1), r2=421(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 107
LDI r2, 421
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

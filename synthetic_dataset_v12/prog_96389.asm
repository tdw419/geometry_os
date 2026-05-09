; DESCRIPTION: Places a orange line segment connecting (189, 199) to (397, 3).
; PLAN: r0=189(x1), r1=199(y1), r2=397(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 199
LDI r2, 397
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

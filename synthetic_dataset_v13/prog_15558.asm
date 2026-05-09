; DESCRIPTION: Places a orange line segment connecting (471, 148) to (397, 155).
; PLAN: r0=471(x1), r1=148(y1), r2=397(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 148
LDI r2, 397
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

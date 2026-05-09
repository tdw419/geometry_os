; DESCRIPTION: Places a orange line segment connecting (120, 199) to (397, 182).
; PLAN: r0=120(x1), r1=199(y1), r2=397(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 199
LDI r2, 397
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

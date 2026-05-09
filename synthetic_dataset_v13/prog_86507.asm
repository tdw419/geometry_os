; DESCRIPTION: Places a red line segment connecting (191, 101) to (397, 239).
; PLAN: r0=191(x1), r1=101(y1), r2=397(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 101
LDI r2, 397
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

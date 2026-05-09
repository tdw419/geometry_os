; DESCRIPTION: Places a orange line segment connecting (397, 192) to (400, 173).
; PLAN: r0=397(x1), r1=192(y1), r2=400(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 192
LDI r2, 400
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

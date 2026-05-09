; DESCRIPTION: Places a orange line segment connecting (3, 2) to (173, 232).
; PLAN: r0=3(x1), r1=2(y1), r2=173(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 2
LDI r2, 173
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

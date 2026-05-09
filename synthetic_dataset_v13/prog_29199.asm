; DESCRIPTION: Places a orange circle of radius 38 at center (459, 158).
; PLAN: r0=459(x), r1=158(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 158
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

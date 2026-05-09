; DESCRIPTION: Places a orange circle of radius 35 at center (137, 218).
; PLAN: r0=137(x), r1=218(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 218
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

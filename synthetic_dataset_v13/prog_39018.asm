; DESCRIPTION: Places a blue circle of radius 33 at center (348, 61).
; PLAN: r0=348(x), r1=61(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 61
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

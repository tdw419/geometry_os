; DESCRIPTION: Creates a blue circular shape at (348, 230) with radius 22.
; PLAN: r0=348(x), r1=230(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 230
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

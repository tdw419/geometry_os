; DESCRIPTION: Creates a blue circular shape at (259, 72) with radius 35.
; PLAN: r0=259(x), r1=72(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 72
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

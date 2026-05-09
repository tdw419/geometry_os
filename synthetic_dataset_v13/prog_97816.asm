; DESCRIPTION: Creates a blue circular shape at (338, 24) with radius 10.
; PLAN: r0=338(x), r1=24(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 24
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

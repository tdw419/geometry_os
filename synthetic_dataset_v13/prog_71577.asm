; DESCRIPTION: Creates a blue circular shape at (381, 28) with radius 20.
; PLAN: r0=381(x), r1=28(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 28
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT

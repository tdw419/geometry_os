; DESCRIPTION: Creates a black circular shape at (382, 74) with radius 55.
; PLAN: r0=382(x), r1=74(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 74
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

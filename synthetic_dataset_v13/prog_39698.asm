; DESCRIPTION: Creates a black circular shape at (203, 95) with radius 12.
; PLAN: r0=203(x), r1=95(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 95
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a black circular shape at (332, 27) with radius 12.
; PLAN: r0=332(x), r1=27(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 27
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a black circular shape at (442, 134) with radius 55.
; PLAN: r0=442(x), r1=134(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 134
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

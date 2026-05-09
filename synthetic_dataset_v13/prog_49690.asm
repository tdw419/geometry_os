; DESCRIPTION: Creates a black circular shape at (442, 111) with radius 35.
; PLAN: r0=442(x), r1=111(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 111
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a white circular shape at (386, 224) with radius 29.
; PLAN: r0=386(x), r1=224(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 224
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a white circular shape at (436, 78) with radius 56.
; PLAN: r0=436(x), r1=78(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 78
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

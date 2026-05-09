; DESCRIPTION: Creates a white circular shape at (421, 148) with radius 59.
; PLAN: r0=421(x), r1=148(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 148
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

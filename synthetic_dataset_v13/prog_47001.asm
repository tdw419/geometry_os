; DESCRIPTION: Places a white circle of radius 69 at center (78, 184).
; PLAN: r0=78(x), r1=184(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 184
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

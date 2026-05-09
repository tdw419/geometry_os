; DESCRIPTION: Places a white circle of radius 53 at center (418, 69).
; PLAN: r0=418(x), r1=69(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 69
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

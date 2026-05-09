; DESCRIPTION: Places a white circle of radius 37 at center (183, 184).
; PLAN: r0=183(x), r1=184(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 184
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

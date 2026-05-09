; DESCRIPTION: Places a white circle of radius 12 at center (191, 122).
; PLAN: r0=191(x), r1=122(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 122
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

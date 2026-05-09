; DESCRIPTION: Places a white circle of radius 12 at center (77, 224).
; PLAN: r0=77(x), r1=224(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 224
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

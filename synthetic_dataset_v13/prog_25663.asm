; DESCRIPTION: Creates a white circular shape at (382, 210) with radius 46.
; PLAN: r0=382(x), r1=210(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 210
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Creates a white circular shape at (223, 241) with radius 12.
; PLAN: r0=223(x), r1=241(y), r2=12(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 241
LDI r2, 12
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

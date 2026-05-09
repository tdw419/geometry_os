; DESCRIPTION: Creates a white circular shape at (177, 144) with radius 62.
; PLAN: r0=177(x), r1=144(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 144
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

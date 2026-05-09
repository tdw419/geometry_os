; DESCRIPTION: Creates a white circular shape at (75, 189) with radius 58.
; PLAN: r0=75(x), r1=189(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 189
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

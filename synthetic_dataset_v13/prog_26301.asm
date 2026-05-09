; DESCRIPTION: Creates a white circular shape at (456, 225) with radius 17.
; PLAN: r0=456(x), r1=225(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 456
LDI r1, 225
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

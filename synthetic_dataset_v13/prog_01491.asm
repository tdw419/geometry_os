; DESCRIPTION: Creates a green circular shape at (425, 113) with radius 73.
; PLAN: r0=425(x), r1=113(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 113
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

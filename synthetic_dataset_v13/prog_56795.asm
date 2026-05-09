; DESCRIPTION: Creates a black circular shape at (82, 113) with radius 34.
; PLAN: r0=82(x), r1=113(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 113
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

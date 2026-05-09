; DESCRIPTION: Creates a black circular shape at (403, 103) with radius 47.
; PLAN: r0=403(x), r1=103(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 103
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

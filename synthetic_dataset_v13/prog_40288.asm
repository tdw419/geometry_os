; DESCRIPTION: Creates a white circular shape at (372, 233) with radius 13.
; PLAN: r0=372(x), r1=233(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 233
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

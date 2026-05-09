; DESCRIPTION: Creates a green circular shape at (308, 43) with radius 39.
; PLAN: r0=308(x), r1=43(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 43
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

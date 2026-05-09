; DESCRIPTION: Creates a white circular shape at (153, 210) with radius 39.
; PLAN: r0=153(x), r1=210(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 210
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

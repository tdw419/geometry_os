; DESCRIPTION: Creates a white circular shape at (39, 48) with radius 11.
; PLAN: r0=39(x), r1=48(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 39
LDI r1, 48
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

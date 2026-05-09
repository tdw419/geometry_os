; DESCRIPTION: Creates a white circular shape at (238, 144) with radius 48.
; PLAN: r0=238(x), r1=144(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 144
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

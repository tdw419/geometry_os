; DESCRIPTION: Creates a white circular shape at (415, 136) with radius 65.
; PLAN: r0=415(x), r1=136(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 136
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

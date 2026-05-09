; DESCRIPTION: Creates a white circular shape at (213, 96) with radius 24.
; PLAN: r0=213(x), r1=96(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 96
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

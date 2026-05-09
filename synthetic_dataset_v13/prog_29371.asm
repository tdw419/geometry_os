; DESCRIPTION: Creates a white circular shape at (486, 64) with radius 25.
; PLAN: r0=486(x), r1=64(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 486
LDI r1, 64
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

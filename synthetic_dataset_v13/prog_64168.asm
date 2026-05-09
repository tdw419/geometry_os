; DESCRIPTION: Creates a white circular shape at (31, 220) with radius 28.
; PLAN: r0=31(x), r1=220(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 220
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

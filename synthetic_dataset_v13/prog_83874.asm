; DESCRIPTION: Creates a white circular shape at (324, 36) with radius 10.
; PLAN: r0=324(x), r1=36(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 36
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

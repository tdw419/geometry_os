; DESCRIPTION: Creates a white circular shape at (327, 156) with radius 75.
; PLAN: r0=327(x), r1=156(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 156
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

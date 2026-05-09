; DESCRIPTION: Creates a green circular shape at (384, 179) with radius 73.
; PLAN: r0=384(x), r1=179(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 179
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

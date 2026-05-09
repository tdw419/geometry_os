; DESCRIPTION: Creates a white circular shape at (326, 64) with radius 16.
; PLAN: r0=326(x), r1=64(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 64
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

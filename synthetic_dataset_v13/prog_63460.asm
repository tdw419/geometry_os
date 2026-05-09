; DESCRIPTION: Creates a white circular shape at (384, 111) with radius 62.
; PLAN: r0=384(x), r1=111(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 111
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

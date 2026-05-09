; DESCRIPTION: Draws a white circle centered at (384, 63) with radius 28.
; PLAN: r0=384(x), r1=63(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 63
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

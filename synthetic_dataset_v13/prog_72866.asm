; DESCRIPTION: Draws a white circle centered at (384, 214) with radius 13.
; PLAN: r0=384(x), r1=214(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 214
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

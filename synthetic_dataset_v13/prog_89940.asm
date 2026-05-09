; DESCRIPTION: Draws a white circle centered at (282, 163) with radius 64.
; PLAN: r0=282(x), r1=163(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 163
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

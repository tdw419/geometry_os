; DESCRIPTION: Draws a white circle centered at (113, 128) with radius 51.
; PLAN: r0=113(x), r1=128(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 128
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

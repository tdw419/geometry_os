; DESCRIPTION: Draws a white circle centered at (261, 161) with radius 64.
; PLAN: r0=261(x), r1=161(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 161
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a white circle centered at (224, 167) with radius 64.
; PLAN: r0=224(x), r1=167(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 167
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

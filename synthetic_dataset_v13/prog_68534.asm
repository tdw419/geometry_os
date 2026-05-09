; DESCRIPTION: Draws a white circle centered at (224, 111) with radius 43.
; PLAN: r0=224(x), r1=111(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 111
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

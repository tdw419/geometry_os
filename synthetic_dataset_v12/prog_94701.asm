; DESCRIPTION: Draws a white circle centered at (417, 130) with radius 36.
; PLAN: r0=417(x), r1=130(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 130
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

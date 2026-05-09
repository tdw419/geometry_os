; DESCRIPTION: Draws a white circle centered at (50, 130) with radius 44.
; PLAN: r0=50(x), r1=130(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 130
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT

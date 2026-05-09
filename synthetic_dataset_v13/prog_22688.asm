; DESCRIPTION: Draws a orange circle centered at (267, 130) with radius 76.
; PLAN: r0=267(x), r1=130(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 267
LDI r1, 130
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

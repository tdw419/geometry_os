; DESCRIPTION: Draws a black circle centered at (108, 130) with radius 71.
; PLAN: r0=108(x), r1=130(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 130
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

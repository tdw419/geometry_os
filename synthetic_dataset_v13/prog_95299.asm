; DESCRIPTION: Draws a black circle centered at (91, 130) with radius 59.
; PLAN: r0=91(x), r1=130(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 130
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a green circle centered at (420, 130) with radius 12.
; PLAN: r0=420(x), r1=130(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 420
LDI r1, 130
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

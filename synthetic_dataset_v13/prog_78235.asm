; DESCRIPTION: Draws a green circle centered at (394, 130) with radius 23.
; PLAN: r0=394(x), r1=130(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 130
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a yellow circle centered at (361, 130) with radius 63.
; PLAN: r0=361(x), r1=130(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 130
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT

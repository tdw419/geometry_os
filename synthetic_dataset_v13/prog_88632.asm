; DESCRIPTION: Draws a orange circle centered at (453, 130) with radius 55.
; PLAN: r0=453(x), r1=130(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 130
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

; DESCRIPTION: Draws a cyan circle centered at (461, 130) with radius 14.
; PLAN: r0=461(x), r1=130(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 130
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT

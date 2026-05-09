; DESCRIPTION: Composite: Places a black dot at position (71, 239) then Draws a magenta circle centered at (254, 130) with radius 67.
; PLAN: r0=71(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=130(y), r7=67(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 239
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 254
LDI r6, 130
LDI r7, 67
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

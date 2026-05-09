; DESCRIPTION: Composite: Sets a single green pixel at (10, 130) then Draws a blue circle centered at (341, 71) with radius 55.
; PLAN: r0=10(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=71(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 10
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 341
LDI r6, 71
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

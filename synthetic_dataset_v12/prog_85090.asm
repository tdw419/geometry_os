; DESCRIPTION: Composite: Sets a single cyan pixel at (151, 130) then Draws a blue circle centered at (474, 184) with radius 11.
; PLAN: r0=151(x), r1=130(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=474(x), r6=184(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 130
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 184
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

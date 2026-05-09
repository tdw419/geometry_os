; DESCRIPTION: Composite: Sets a single white pixel at (136, 2) then Draws a yellow circle centered at (386, 75) with radius 26.
; PLAN: r0=136(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=75(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 136
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 386
LDI r6, 75
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

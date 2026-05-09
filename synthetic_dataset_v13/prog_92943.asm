; DESCRIPTION: Composite: Sets a single white pixel at (129, 172) then Draws a black circle centered at (168, 139) with radius 79.
; PLAN: r0=129(x), r1=172(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=139(y), r7=79(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 172
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 139
LDI r7, 79
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single green pixel at (378, 21) then Draws a blue circle centered at (210, 42) with radius 39.
; PLAN: r0=378(x), r1=21(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=210(x), r6=42(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 378
LDI r1, 21
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 210
LDI r6, 42
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single magenta pixel at (467, 78) then Draws a green circle centered at (263, 192) with radius 24.
; PLAN: r0=467(x), r1=78(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=192(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 467
LDI r1, 78
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 263
LDI r6, 192
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

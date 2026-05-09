; DESCRIPTION: Composite: Sets a single cyan pixel at (176, 177) then Creates a blue circular shape at (396, 113) with radius 63.
; PLAN: r0=176(x), r1=177(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=113(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 177
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 113
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

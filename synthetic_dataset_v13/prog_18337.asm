; DESCRIPTION: Composite: Places a blue dot at position (112, 94) then Draws a black circle centered at (139, 183) with radius 54.
; PLAN: r0=112(x), r1=94(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=183(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 94
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 183
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single magenta pixel at (269, 211) then Draws a green circle centered at (436, 151) with radius 62.
; PLAN: r0=269(x), r1=211(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=151(y), r7=62(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 211
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 151
LDI r7, 62
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT

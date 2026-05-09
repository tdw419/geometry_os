; DESCRIPTION: Composite: Sets a single magenta pixel at (207, 101) then Draws a yellow circle centered at (325, 192) with radius 24.
; PLAN: r0=207(x), r1=101(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=192(y), r7=24(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 207
LDI r1, 101
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 325
LDI r6, 192
LDI r7, 24
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

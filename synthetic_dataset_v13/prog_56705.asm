; DESCRIPTION: Composite: Sets a single magenta pixel at (396, 163) then Draws a magenta circle centered at (284, 201) with radius 32.
; PLAN: r0=396(x), r1=163(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=201(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 163
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 284
LDI r6, 201
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

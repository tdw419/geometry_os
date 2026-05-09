; DESCRIPTION: Composite: Sets a single yellow pixel at (201, 197) then Draws a yellow circle centered at (202, 172) with radius 32.
; PLAN: r0=201(x), r1=197(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=172(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 197
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 202
LDI r6, 172
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT

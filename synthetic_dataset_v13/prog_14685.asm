; DESCRIPTION: Composite: Draws a yellow circle centered at (104, 76) with radius 76 then Sets a single blue pixel at (307, 135).
; PLAN: r0=104(x), r1=76(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 104
LDI r1, 76
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

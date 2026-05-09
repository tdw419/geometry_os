; DESCRIPTION: Composite: Draws a magenta circle centered at (442, 214) with radius 28 then Sets a single blue pixel at (374, 194).
; PLAN: r0=442(x), r1=214(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=194(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 214
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 194
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

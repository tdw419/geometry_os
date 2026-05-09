; DESCRIPTION: Composite: Sets a single blue pixel at (114, 173) then Draws a purple circle centered at (230, 151) with radius 28.
; PLAN: r0=114(x), r1=173(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=151(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 173
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 151
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

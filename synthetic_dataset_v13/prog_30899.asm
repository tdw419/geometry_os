; DESCRIPTION: Composite: Sets a single blue pixel at (184, 164) then Draws a purple circle centered at (326, 74) with radius 50.
; PLAN: r0=184(x), r1=164(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=74(y), r7=50(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 184
LDI r1, 164
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 326
LDI r6, 74
LDI r7, 50
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single purple pixel at (263, 222) then Draws a black circle centered at (85, 111) with radius 32.
; PLAN: r0=263(x), r1=222(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=111(y), r7=32(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 222
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 111
LDI r7, 32
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

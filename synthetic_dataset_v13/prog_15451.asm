; DESCRIPTION: Composite: Sets a single green pixel at (245, 245) then Draws a magenta circle centered at (116, 121) with radius 32.
; PLAN: r0=245(x), r1=245(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=121(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 245
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 121
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

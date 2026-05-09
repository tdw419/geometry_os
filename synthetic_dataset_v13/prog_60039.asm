; DESCRIPTION: Composite: Sets a single green pixel at (347, 23) then Places a magenta circle of radius 28 at center (195, 223).
; PLAN: r0=347(x), r1=23(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=223(y), r7=28(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 23
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 195
LDI r6, 223
LDI r7, 28
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT

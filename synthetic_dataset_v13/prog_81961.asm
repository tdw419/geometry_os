; DESCRIPTION: Composite: Sets a single yellow pixel at (128, 2) then Places a blue circle of radius 53 at center (255, 183).
; PLAN: r0=128(x), r1=2(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=183(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 128
LDI r1, 2
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 255
LDI r6, 183
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single yellow pixel at (480, 53) then Draws a cyan circle centered at (219, 192) with radius 60.
; PLAN: r0=480(x), r1=53(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=192(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 53
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 219
LDI r6, 192
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT

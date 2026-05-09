; DESCRIPTION: Composite: Draws a cyan circle centered at (269, 228) with radius 28 then Sets a single purple pixel at (129, 82).
; PLAN: r0=269(x), r1=228(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=82(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 228
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 82
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

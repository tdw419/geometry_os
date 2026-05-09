; DESCRIPTION: Composite: Draws a purple circle centered at (439, 64) with radius 30 then Sets a single cyan pixel at (53, 168).
; PLAN: r0=439(x), r1=64(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=168(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 64
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 168
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

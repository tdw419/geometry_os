; DESCRIPTION: Composite: Draws a black circle centered at (455, 128) with radius 15 then Sets a single white pixel at (96, 111).
; PLAN: r0=455(x), r1=128(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=111(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 455
LDI r1, 128
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 111
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

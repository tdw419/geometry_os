; DESCRIPTION: Composite: Places a purple dot at position (198, 244) then Draws a black circle centered at (436, 143) with radius 49.
; PLAN: r0=198(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=436(x), r6=143(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 436
LDI r6, 143
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

; DESCRIPTION: Composite: Sets a single white pixel at (397, 206) then Draws a black circle centered at (372, 105) with radius 72.
; PLAN: r0=397(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=105(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 105
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

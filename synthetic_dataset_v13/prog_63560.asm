; DESCRIPTION: Composite: Draws a black circle centered at (268, 189) with radius 57 then Places a green dot at position (271, 199).
; PLAN: r0=268(x), r1=189(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=271(x), r6=199(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 189
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 271
LDI r6, 199
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT

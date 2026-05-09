; DESCRIPTION: Composite: Draws a cyan circle centered at (261, 62) with radius 40 then Places a magenta dot at position (460, 211).
; PLAN: r0=261(x), r1=62(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=211(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 261
LDI r1, 62
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 211
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT

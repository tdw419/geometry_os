; DESCRIPTION: Composite: Draws a green circle centered at (384, 127) with radius 64 then Places a cyan dot at position (332, 75).
; PLAN: r0=384(x), r1=127(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=75(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 127
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 75
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

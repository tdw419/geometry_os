; DESCRIPTION: Composite: Draws a white circle centered at (304, 164) with radius 75 then Places a magenta dot at position (343, 99).
; PLAN: r0=304(x), r1=164(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=99(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 164
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 99
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT

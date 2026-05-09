; DESCRIPTION: Composite: Draws a magenta circle centered at (244, 117) with radius 34 then Places a white dot at position (338, 98).
; PLAN: r0=244(x), r1=117(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=98(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 117
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 98
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

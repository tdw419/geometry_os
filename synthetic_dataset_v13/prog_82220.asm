; DESCRIPTION: Composite: Draws a magenta circle centered at (326, 172) with radius 47 then Sets a single white pixel at (43, 255).
; PLAN: r0=326(x), r1=172(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 326
LDI r1, 172
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

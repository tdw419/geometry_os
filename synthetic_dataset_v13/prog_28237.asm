; DESCRIPTION: Composite: Draws a magenta circle centered at (111, 107) with radius 73 then Places a white dot at position (446, 128).
; PLAN: r0=111(x), r1=107(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=128(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 107
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 128
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT

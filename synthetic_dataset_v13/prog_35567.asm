; DESCRIPTION: Composite: Draws a magenta circle centered at (111, 217) with radius 22 then Places a black dot at position (26, 70).
; PLAN: r0=111(x), r1=217(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=70(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 217
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 70
LDI r7, 0x000000
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Draws a magenta circle centered at (405, 141) with radius 23 then Places a blue dot at position (75, 103).
; PLAN: r0=405(x), r1=141(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=75(x), r6=103(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 405
LDI r1, 141
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 75
LDI r6, 103
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

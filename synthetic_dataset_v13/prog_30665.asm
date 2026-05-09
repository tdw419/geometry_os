; DESCRIPTION: Composite: Draws a black circle centered at (311, 69) with radius 43 then Places a yellow dot at position (455, 186).
; PLAN: r0=311(x), r1=69(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 69
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

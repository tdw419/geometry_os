; DESCRIPTION: Composite: Draws a magenta circle centered at (303, 204) with radius 23 then Places a black dot at position (323, 125).
; PLAN: r0=303(x), r1=204(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=125(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 204
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 125
LDI r7, 0x000000
PSET r5, r6, r7
HALT

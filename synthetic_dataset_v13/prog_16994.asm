; DESCRIPTION: Composite: Draws a purple circle centered at (154, 207) with radius 48 then Places a purple dot at position (166, 232).
; PLAN: r0=154(x), r1=207(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=232(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 207
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 232
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT

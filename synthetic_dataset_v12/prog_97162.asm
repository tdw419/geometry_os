; DESCRIPTION: Composite: Draws a black circle centered at (109, 68) with radius 30 then Places a blue dot at position (13, 150).
; PLAN: r0=109(x), r1=68(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=150(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 109
LDI r1, 68
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 150
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

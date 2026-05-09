; DESCRIPTION: Composite: Draws a blue circle centered at (150, 168) with radius 71 then Places a yellow dot at position (351, 150).
; PLAN: r0=150(x), r1=168(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=150(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 168
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 150
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

; DESCRIPTION: Composite: Draws a blue circle centered at (287, 149) with radius 45 then Places a blue dot at position (197, 232).
; PLAN: r0=287(x), r1=149(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x), r6=232(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 287
LDI r1, 149
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 232
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

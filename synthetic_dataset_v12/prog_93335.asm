; DESCRIPTION: Composite: Places a purple circle of radius 32 at center (473, 62) then Places a black dot at position (163, 239).
; PLAN: r0=473(x), r1=62(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=239(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 473
LDI r1, 62
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 239
LDI r7, 0x000000
PSET r5, r6, r7
HALT

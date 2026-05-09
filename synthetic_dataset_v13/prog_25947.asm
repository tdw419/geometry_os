; DESCRIPTION: Composite: Places a black circle of radius 40 at center (354, 67) then Places a blue dot at position (406, 232).
; PLAN: r0=354(x), r1=67(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=406(x), r6=232(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 67
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 406
LDI r6, 232
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT

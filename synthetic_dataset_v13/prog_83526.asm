; DESCRIPTION: Composite: Places a black circle of radius 42 at center (232, 99) then Places a black dot at position (227, 151).
; PLAN: r0=232(x), r1=99(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=151(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 232
LDI r1, 99
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 151
LDI r7, 0x000000
PSET r5, r6, r7
HALT

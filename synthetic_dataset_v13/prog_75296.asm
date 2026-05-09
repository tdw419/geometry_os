; DESCRIPTION: Composite: Creates a purple circular shape at (82, 141) with radius 26 then Places a cyan dot at position (354, 126).
; PLAN: r0=82(x), r1=141(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=126(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 82
LDI r1, 141
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 126
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

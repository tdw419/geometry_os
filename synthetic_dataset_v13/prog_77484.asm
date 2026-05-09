; DESCRIPTION: Composite: Creates a white circular shape at (161, 204) with radius 42 then Places a black dot at position (26, 3).
; PLAN: r0=161(x), r1=204(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x), r6=3(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 204
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 3
LDI r7, 0x000000
PSET r5, r6, r7
HALT

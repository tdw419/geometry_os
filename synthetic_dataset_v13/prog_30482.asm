; DESCRIPTION: Composite: Creates a red circular shape at (107, 103) with radius 45 then Places a cyan dot at position (122, 34).
; PLAN: r0=107(x), r1=103(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=34(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 103
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 34
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

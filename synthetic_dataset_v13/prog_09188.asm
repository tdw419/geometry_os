; DESCRIPTION: Composite: Creates a black circular shape at (443, 117) with radius 37 then Places a cyan dot at position (372, 59).
; PLAN: r0=443(x), r1=117(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 443
LDI r1, 117
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

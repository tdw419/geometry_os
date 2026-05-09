; DESCRIPTION: Composite: Creates a white circular shape at (259, 99) with radius 68 then Places a cyan dot at position (159, 38).
; PLAN: r0=259(x), r1=99(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=38(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 259
LDI r1, 99
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 38
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT

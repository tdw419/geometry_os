; DESCRIPTION: Composite: Places a cyan dot at position (126, 99) then Creates a black circular shape at (211, 44) with radius 15.
; PLAN: r0=126(x), r1=99(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=44(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 99
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 44
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT

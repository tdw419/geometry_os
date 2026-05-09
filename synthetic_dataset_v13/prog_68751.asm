; DESCRIPTION: Composite: Places a cyan dot at position (76, 175) then Creates a white circular shape at (273, 172) with radius 46.
; PLAN: r0=76(x), r1=175(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=172(y), r7=46(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 76
LDI r1, 175
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 172
LDI r7, 46
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT

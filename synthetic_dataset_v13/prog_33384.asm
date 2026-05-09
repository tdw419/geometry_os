; DESCRIPTION: Composite: Places a white dot at position (86, 139) then Creates a orange circular shape at (477, 95) with radius 27.
; PLAN: r0=86(x), r1=139(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=477(x), r6=95(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 139
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 477
LDI r6, 95
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

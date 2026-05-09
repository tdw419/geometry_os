; DESCRIPTION: Composite: Sets a single purple pixel at (479, 76) then Creates a orange circular shape at (181, 175) with radius 75.
; PLAN: r0=479(x), r1=76(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=175(y), r7=75(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 479
LDI r1, 76
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 181
LDI r6, 175
LDI r7, 75
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

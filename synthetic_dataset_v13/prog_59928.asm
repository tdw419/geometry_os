; DESCRIPTION: Composite: Sets a single purple pixel at (138, 24) then Creates a orange circular shape at (239, 80) with radius 26.
; PLAN: r0=138(x), r1=24(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=80(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 138
LDI r1, 24
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 239
LDI r6, 80
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT

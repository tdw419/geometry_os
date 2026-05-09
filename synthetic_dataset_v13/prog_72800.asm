; DESCRIPTION: Composite: Sets a single purple pixel at (445, 119) then Creates a blue circular shape at (173, 76) with radius 71.
; PLAN: r0=445(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=76(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 445
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 76
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
